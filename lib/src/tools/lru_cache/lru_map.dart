import 'dart:collection';

typedef OnLruMapInvalidate<K, V> = void Function(K key, V value);
typedef OnLruMapComputeSize<K, V> = int Function(K key, V value);

class _LinkedEntry<K, V> {
  _LinkedEntry(this.key, this.value);

  K key;
  V value;

  _LinkedEntry<K, V>? next;
  _LinkedEntry<K, V>? previous;
}

class LruMap<K, V> implements Map<K, V> {
  LruMap({
    int? maximumSize,
    OnLruMapComputeSize<K, V>? onComputeSize,
    OnLruMapInvalidate<K, V>? onInvalidate,
  })  : _maximumSize = maximumSize ?? _DEFAULT_MAXIMUM_SIZE,
        _onComputeSize = onComputeSize,
        _onInvalidate = onInvalidate;

  static const _DEFAULT_MAXIMUM_SIZE = 100;

  final OnLruMapInvalidate<K, V>? _onInvalidate;
  final OnLruMapComputeSize<K, V>? _onComputeSize;

  final Map<K, _LinkedEntry<K, V>> _entries = HashMap<K, _LinkedEntry<K, V>>();

  int _maximumSize;
  int _size = 0;

  int get size => _size;

  _LinkedEntry<K, V>? _head;
  _LinkedEntry<K, V>? _tail;

  /// Adds all key-value pairs of [other] to this map.
  ///
  /// The operation is equivalent to doing `this[key] = value` for each key and
  /// associated value in [other]. It iterates over [other], which must
  /// therefore not change during the iteration.
  ///
  /// If a key of [other] is already in this map, its value is overwritten. If
  /// the number of unique keys is greater than [maximumSize] then the least
  /// recently use keys are evicted. For keys written to by [other], the least
  /// recently user order is determined by [other]'s iteration order.
  @override
  void addAll(Map<K, V> other) => other.forEach((k, v) => this[k] = v);

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    for (final entry in entries) {
      this[entry.key] = entry.value;
    }
  }

  @override
  LruMap<K2, V2> cast<K2, V2>() {
    // TODO(cbracken): Dart 2.0 requires this method to be implemented.
    throw UnimplementedError('cast');
  }

  @override
  void clear() {
    _entries.clear();
    _head = _tail = null;
    _size = 0;
  }

  @override
  bool containsKey(Object? key) => _entries.containsKey(key);

  @override
  bool containsValue(Object? value) => values.contains(value);

  @override
  Iterable<MapEntry<K, V>> get entries =>
      _entries.values.map((entry) => MapEntry<K, V>(entry.key, entry.value));

  @override
  void forEach(void action(K key, V value)) {
    var head = _head;
    while (head != null) {
      action(head.key, head.value);
      head = head.next;
    }
  }

  @override
  int get length => _entries.length;

  @override
  bool get isEmpty => _entries.isEmpty;

  @override
  bool get isNotEmpty => _entries.isNotEmpty;

  /// Creates an [Iterable] around the entries of the map.
  Iterable<_LinkedEntry<K, V>> _iterable() {
    if (_head == null) {
      return const Iterable.empty();
    }
    final List<_LinkedEntry<K, V>> list = <_LinkedEntry<K, V>>[];
    var head = _head;
    while (head != null) {
      list.add(head);
      head = head.next;
    }

    return list;
  }

  /// The keys of [this] - in order of MRU to LRU.
  ///
  /// The returned iterable does *not* have efficient `length` or `contains`.
  @override
  Iterable<K> get keys => _iterable().map((e) => e.key);

  /// The values of [this] - in order of MRU to LRU.
  ///
  /// The returned iterable does *not* have efficient `length` or `contains`.
  @override
  Iterable<V> get values => _iterable().map((e) => e.value);

  @override
  Map<K2, V2> map<K2, V2>(Object transform(K key, V value)) {
    // TODO(cbracken): Dart 2.0 requires this method to be implemented.
    // Change Object to MapEntry<K2, V2> when
    // the MapEntry class has been added.
    throw UnimplementedError('map');
  }

  int get maximumSize => _maximumSize;

  set maximumSize(int maximumSize) {
    while (_size > maximumSize) {
      _removeLru();
    }
    _maximumSize = maximumSize;
  }

  /// Look up the value associated with [key], or add a new value if it isn't
  /// there. The pair is promoted to the MRU position.
  ///
  /// Otherwise calls [ifAbsent] to get a new value, associates [key] to that
  /// [value], and then returns the new [value], with the key-value pair in the
  /// MRU position. If this causes [length] to exceed [maximumSize], then the
  /// LRU position is removed.
  @override
  V putIfAbsent(K key, V ifAbsent()) {
    final entry =
    _entries.putIfAbsent(key, () => _createEntry(key, ifAbsent()));

    _size = _getComputeSize();
    if (_size > maximumSize) {
      _removeLru();
    }
    _promoteEntry(entry);
    return entry.value;
  }

  /// Get the value for a [key] in the [Map].
  /// The [key] will be promoted to the 'Most Recently Used' position.
  ///
  /// *NOTE*: Calling `[]` inside an iteration over keys/values is currently
  /// unsupported; use [keys] or [values] if you need information about entries
  /// without modifying their position.
  @override
  V? operator [](Object? key) {
    final entry = _entries[key];
    if (entry != null) {
      _promoteEntry(entry);
      return entry.value;
    } else {
      return null;
    }
  }

  /// If [key] already exists, promotes it to the MRU position & assigns
  /// [value].
  ///
  /// Otherwise, adds [key] and [value] to the MRU position.  If [length]
  /// exceeds [maximumSize] while adding, removes the LRU position.
  @override
  void operator []=(K key, V value) {
    // Add this item to the MRU position.
    _insertMru(_createEntry(key, value));

    // Remove the LRU item if the size would be exceeded by adding this item.
    if (_size > maximumSize) {
      _removeLru();
    }
  }

  @override
  V? remove(Object? key) {
    final entry = _entries.remove(key);
    if (entry == null) {
      return null;
    } else {
      _invalidated(entry);
    }

    if (entry == _head && entry == _tail) {
      _head = _tail = null;
    } else if (entry == _head) {
      _head = _head!.next;
      _head?.previous = null;
    } else if (entry == _tail) {
      _tail = _tail!.previous;
      _tail?.next = null;
    } else {
      entry.previous!.next = entry.next;
      entry.next!.previous = entry.previous;
    }
    return entry.value;
  }

  @override
  void removeWhere(bool test(K key, V value)) {
    var keysToRemove = <K>[];
    _entries.forEach((key, entry) {
      if (test(key, entry.value)) keysToRemove.add(key);
    });
    keysToRemove.forEach(remove);
  }

  @override
  String toString() {
    return 'LruMap{_entries: $_entries}';
  }

  @override
  V update(K key, V update(V value), {V ifAbsent()?}) {
    V newValue;
    if (containsKey(key)) {
      newValue = update(this[key]!);
    } else {
      if (ifAbsent == null) {
        throw ArgumentError.value(key, 'key', 'Key not in map');
      }
      newValue = ifAbsent();
    }

    // Add this item to the MRU position.
    _insertMru(_createEntry(key, newValue));

    if (_size > maximumSize) {
      _removeLru();
    }
    return newValue;
  }

  @override
  void updateAll(V update(K key, V value)) {
    _entries.forEach((key, entry) {
      var newValue = _createEntry(key, update(key, entry.value));
      _entries[key] = newValue;
    });
  }

  /// Moves [entry] to the MRU position, shifting the linked list if necessary.
  void _promoteEntry(_LinkedEntry<K, V> entry) {
    // If this entry is already in the MRU position we are done.
    if (entry == _head) {
      return;
    }

    if (entry.previous != null) {
      // If already existed in the map, link previous to next.
      entry.previous!.next = entry.next;

      // If this was the tail element, assign a new tail.
      if (_tail == entry) {
        _tail = entry.previous;
      }
    }
    // If this entry is not the end of the list then link the next entry to the previous entry.
    if (entry.next != null) {
      entry.next!.previous = entry.previous;
    }

    // Replace head with this element.
    if (_head != null) {
      _head!.previous = entry;
    }
    entry.previous = null;
    entry.next = _head;
    _head = entry;

    // Add a tail if this is the first element.
    if (_tail == null) {
      assert(length == 1);
      _tail = _head;
    }
  }

  /// Creates and returns an entry from [key] and [value].
  _LinkedEntry<K, V> _createEntry(K key, V value) {
    return _LinkedEntry<K, V>(key, value);
  }

  /// If [entry] does not exist, inserts it into the backing map.  If it does,
  /// replaces the existing [_LinkedEntry.value] with [entry.value].  Then, in
  /// either case, promotes [entry] to the MRU position.
  void _insertMru(_LinkedEntry<K, V> entry) {
    // Insert a new entry if necessary (only 1 hash lookup in entire function).
    // Otherwise, just updates the existing value.
    final value = entry.value;
    _size += _computeSize(entry);
    _promoteEntry(_entries.putIfAbsent(entry.key, () => entry)..value = value);
  }

  /// Removes the LRU position, shifting the linked list if necessary.
  void _removeLru() {
    // Remove the tail from the internal map.
    final value = _entries.remove(_tail!.key);
    if(value != null) {
      _invalidated(value);
    }
    // Remove the tail element itself.
    _tail = _tail!.previous;
    _tail?.next = null;

    // If we removed the last element, clear the head too.
    if (_tail == null) {
      _head = null;
    }
  }

  int _computeSize(_LinkedEntry<K, V> entry) {
    final onComputeSize = _onComputeSize;
    if(onComputeSize != null) {
      return onComputeSize(entry.key, entry.value);
    }
    return 1;
  }

  int _getComputeSize() {
    int size = 0;
    _iterable().forEach((element) => size += _computeSize(element));
    return size;
  }

  void _invalidated(_LinkedEntry<K, V> entry) {
    _size -= _computeSize(entry);
    if(_size < 0) {
      _size = _getComputeSize();
    }

    final onInvalidate = _onInvalidate;
    if(onInvalidate != null) {
      onInvalidate(entry.key, entry.value);
    }
  }
}