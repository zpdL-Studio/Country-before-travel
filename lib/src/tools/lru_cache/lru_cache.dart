import 'dart:io' as io;
import 'dart:typed_data';

import 'lru_disk_cache.dart';
import 'lru_file_writer_cache.dart';
import 'lru_map.dart';
import 'lru_memory_cache.dart';

abstract class LruCache<K, V> {
  static LruCache<K, V> memory<K, V>(
          {int? maximumSize,
            OnLruMapComputeSize<K, V>? onComputeSize,
            OnLruMapInvalidate<K, V>? onInvalidate}) =>
      LruMemoryCache<K, V>(
          maximumSize: maximumSize,
          onComputeSize: onComputeSize,
          onInvalidate: onInvalidate);

  static LruCache<String, Uint8List> disk(
          {required String directory,
          int? maximumSize,
          OnLruMapComputeSize<String, io.File>? onComputeSize}) =>
      LruDiskCache(
          directory: directory,
          maximumSize: maximumSize,
          onComputeSize: onComputeSize);

  static LruFileWriterCache fileWriter(
          {required String directory,
          required OnLruFileWriterCacheWriter onWriter,
          int? maximumSize,
          OnLruMapComputeSize<String, io.File>? onComputeSize}) =>
      LruFileWriterCache(
          directory: directory,
          onWriter: onWriter,
          maximumSize: maximumSize,
          onComputeSize: onComputeSize);

  int get size;

  V? get(K key);

  void invalidate(K key);

  void set(K key, V value);

  V? operator [](K key) => get(key);

  void operator []=(K key, V? value) {
    if (value != null) {
      set(key, value);
    } else {
      invalidate(key);
    }
  }
}