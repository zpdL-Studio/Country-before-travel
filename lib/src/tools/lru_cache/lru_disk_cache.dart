import 'dart:io' as io;
import 'dart:typed_data';

import 'lru_cache.dart';
import 'lru_map.dart';

class LruDiskCache extends LruCache<String, Uint8List>{

  final String directory;

  final int? maximumSize;
  final OnLruMapComputeSize<String, io.File>? onComputeSize;

  LruDiskCache({
    required this.directory,
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

  @override
  Uint8List? get(String key) {
    final filePath = _cache[key];
    if (filePath != null) {
      final file = io.File(filePath);
      if (file.existsSync()) {
        return file.readAsBytesSync();
      }
    }
    return null;
  }

  @override
  void invalidate(String key) {
    _cache.remove(key);
  }

  @override
  void set(String key, Uint8List value) {
    io.File file = io.File(_keyToFilePath(key));
    if(file.existsSync()) {
      file.deleteSync();
    }
    file.createSync(recursive: true);
    file.writeAsBytesSync(value);
    _cache[key] = file.path;
  }

  @override
  int get size => _cache.size;

}