import 'dart:io' as io;

import 'lru_map.dart';

typedef OnLruFileWriterCacheWriter = Future<void> Function(String key, io.File file);

class LruFileWriterCache {

  final String directory;
  final OnLruFileWriterCacheWriter onWriter;

  final int? maximumSize;
  final OnLruMapComputeSize<String, io.File>? onComputeSize;

  LruFileWriterCache({
    required this.directory,
    required this.onWriter,
    this.maximumSize,
    this.onComputeSize,
  });

  late final LruMap<String, String> _cache = _initCache();

  String _keyToFilePath(String key) => '$directory/$key';

  String? _filePathToKey(String filePath) {
    final index = filePath.indexOf('$directory/');
    if(index >= 0) {
      return filePath.substring(index);
    }
    return null;
  }

  LruMap<String, String> _initCache() {
    final computeSize = onComputeSize;

    final cache = LruMap<String, String>(
      maximumSize: maximumSize,
      onComputeSize: computeSize != null
          ? (key, value) => computeSize(key, io.File(value))
          : null,
      onInvalidate: (key, value) {
        io.File file = io.File(value);
        if (file.existsSync()) {
          file.deleteSync();
        }
      },
    );

    final directory = io.Directory(this.directory);
    if(directory.existsSync()) {
      final list = directory.listSync();
      for (final fileSystemEntity in list) {
        if(fileSystemEntity is io.File) {
          final key = _filePathToKey(fileSystemEntity.path);
          if(key != null) {
            cache[key] = fileSystemEntity.path;
          }
        }
      }
    }

    return cache;
  }

  int get size => _cache.size;

  io.File? _get(String key) {
    final filePath = _cache[key];
    if (filePath != null) {
      final file = io.File(filePath);
      if (file.existsSync()) {
        return file;
      }
    }
    return null;
  }

  Future<io.File> get(String key) async {
    final existFile = _get(key);
    if(existFile != null) {
      return existFile;
    }

    io.File file = io.File(_keyToFilePath(key));
    if (await file.exists()) {
      await file.delete();
    }
    file = await file.create(recursive: true);
    await onWriter(key, await file.create(recursive: true));
    _cache[key] = file.path;
    return file;
  }
}