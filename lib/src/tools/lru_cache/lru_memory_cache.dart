import 'lru_cache.dart';
import 'lru_map.dart';

class LruMemoryCache<K, V> extends LruCache<K, V> {
  final LruMap<K, V> _cache;

  LruMemoryCache(
      {int? maximumSize,
      OnLruMapComputeSize<K, V>? onComputeSize,
      OnLruMapInvalidate<K, V>? onInvalidate})
      : _cache = LruMap<K, V>(
            maximumSize: maximumSize,
            onComputeSize: onComputeSize,
            onInvalidate: onInvalidate);

  @override
  V? get(K key) => _cache[key];

  @override
  void invalidate(K key) => _cache.remove(key);

  @override
  int get size => _cache.size;

  @override
  void set(K key, V value) => _cache[key] = value;

  Iterable<MapEntry<K, V>> get entries => _cache.entries;
}