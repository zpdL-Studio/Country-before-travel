import 'dart:async';

typedef AsyncDebounceOnDebounce<T> = void Function(T? value);
typedef AsyncDebounceWorker<T> = FutureOr<T?> Function();

class AsyncDebounceWorkerManager<T> {
  AsyncDebounceOnDebounce<T>? _onDebounce;
  set onDebounce(AsyncDebounceOnDebounce<T>? debounce) => _onDebounce = debounce;

  final Duration _duration;

  AsyncDebounceWorkerManager(
      {AsyncDebounceOnDebounce<T>? onDebounce, Duration? duration})
      : this._onDebounce = onDebounce,
        this._duration = duration ?? Duration(milliseconds: 800);

  Object? _identity;

  void debounceWorker(AsyncDebounceWorker<T> worker, {Duration? duration}) {
    final Object identity = Object();
    _identity = identity;

    Future.delayed(duration ?? _duration).then((value) async {
      if(identity == _identity) {
        final result = await worker();
        final onDebounce = _onDebounce;
        if(identity == _identity && onDebounce != null) {
          onDebounce(result);
        }
      }
    });
  }

  void invalidate() => _identity = null;
}