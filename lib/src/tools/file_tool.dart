import 'dart:async';
import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';

class FileTool {
  static final FileTool _instance = FileTool._();

  factory FileTool() => _instance;

  FileTool._();

  io.Directory? _documentsDirectory;

  Future<io.Directory> get documentsDirectory async {
    _documentsDirectory ??= await getApplicationDocumentsDirectory();
    return _documentsDirectory!;
  }

  static String getName(String path) {
    final split = path.split('/');
    if (split.isNotEmpty) {
      return split.last;
    }
    return '';
  }

  static String getExtension(String path) {
    final split = getName(path).split('.');
    if(split.isNotEmpty) {
      return split.last;
    }
    return '';
  }

  Future<String> localToFullPath(String localPath) async {
    final io.Directory directory = await documentsDirectory;
    return '${directory.path}/$localPath';
  }

  static Future<io.File?> file(String path) async {
    return io.File(path);
  }

  static Future<io.File> create(String path) async {
    final file = io.File(path);
    if (await file.exists()) {
      await file.delete();
    }
    return await file.create(recursive: true);
  }

  static Future<void> delete(String path) async {
    final io.File file = io.File(path);
    if(await file.exists()) {
      file.delete(recursive: true);
    }
  }

  static Future<bool> copy(String source, String target) async {
    final io.File file = io.File(source);
    if(await file.exists()) {
      await file.copy(target);
      return true;
    }
    return false;
  }

  static Future<bool> move(String source, String target) async {
    final io.File file = io.File(source);
    if(await file.exists()) {
      await file.rename(target);
      return true;
    }
    return false;
  }

}

class LocalFile {
  final String localPath;
  final String fullPath;

  LocalFile._(this.localPath, this.fullPath);

  static Future<LocalFile> create(String path) async {
    return LocalFile._(
        path,
        await FileTool().localToFullPath(path)
    );
  }

  String get name => FileTool.getName(localPath);

  Future<io.File> createFile() => FileTool.create(fullPath);

  Future<void> deleteFile() => FileTool.delete(fullPath);

  io.File get file => io.File(fullPath);
}