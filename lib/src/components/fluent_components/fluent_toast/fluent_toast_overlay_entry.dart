part of 'fluent_toast.dart';

Widget Function(BuildContext context) _getDefaultBuild({
  required double yOffset,
  required _Holder holder,
  required Widget child,
}) {
  Widget defaultBuilder(BuildContext context) {
    return _Provider(
      holder: holder,
      child: _FluentToastWrapper(
        yOffset: yOffset,
        child: child,
      ),
    );
  }

  return defaultBuilder;
}

class FluentToastOverlayEntry extends OverlayEntry {
  final VoidCallback? onDismissed;
  FluentToastOverlayEntry._({
    required double yOffset,
    required Widget child,
    required this.onDismissed,
    required _Holder holder,
  }) : super(
          builder: _getDefaultBuild(
            yOffset: yOffset,
            holder: holder,
            child: child,
          ),
        );

  factory FluentToastOverlayEntry({
    required double yOffset,
    required VoidCallback? onDismissed,
    required Widget child,
  }) {
    final holder = _Holder();
    final entry = FluentToastOverlayEntry._(
      yOffset: yOffset,
      holder: holder,
      onDismissed: onDismissed,
      child: child,
    );
    holder.entry = entry;
    return entry;
  }

  static FluentToastOverlayEntry of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_Provider>()!
        .holder
        .entry;
  }

  @override
  void remove() {
    super.remove();
    onDismissed?.call();
  }
}

class _Holder {
  late final FluentToastOverlayEntry entry;

  _Holder();
}

class _Provider extends InheritedWidget {
  final _Holder holder;

  _Provider({required this.holder, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
