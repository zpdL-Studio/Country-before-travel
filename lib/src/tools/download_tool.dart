import 'dart:async';
import 'dart:io' as io;

import 'package:http/http.dart' as http;

import 'file_tool.dart';

class DownloadTool {

  static Future<io.File> downloadFile(String url, {String? path, void Function(double progress)? onProgressCallback}) async {
    final req = http.Request('GET', Uri.parse(url));
    final res = await http.Client().send(req);
    if (res.statusCode != 200) {
      throw Exception('response statusCode : ${res.statusCode}');
    }

    io.File? file;
    try {
      final downloadPath = path ?? (await LocalFile.create('temp/${DateTime.now().toString()}')).fullPath;
      file = await FileTool.create(downloadPath);
      await _downloadFile(res, file, onProgressCallback);
    } catch(e) {
      file?.delete();
      rethrow;
    }
    return file;
  }

  static Future<void> _downloadFile(http.StreamedResponse res, io.File file, void Function(double progress)? onProgressCallback) {
    final completer = Completer();
    final contentLength = res.contentLength!;
    int downloadedLength = 0;

    res.stream
        .map((event) {
      downloadedLength += event.length;
      if(onProgressCallback != null) {
        onProgressCallback(downloadedLength / contentLength);
      }
      return event;
    })
        .pipe(file.openWrite())
        .whenComplete(() {
      completer.complete();
    })
        .catchError(completer.completeError);
    return completer.future;
  }
}