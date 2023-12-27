import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  /// Is the delayed call active?
  bool get isRunning => _timer?.isActive ?? false;

  /// Cancel the current delayed call.
  void cancel() {
    _timer?.cancel();
  }

  void call(void Function() action) {
    if (_timer?.isActive ?? false) cancel();

    _timer = Timer(delay, action);
  }
}
