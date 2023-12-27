part of 'fluent_toast.dart';

class _FluentToastWrapper extends StatelessWidget {
  final double yOffset;
  final Widget child;

  const _FluentToastWrapper({
    required this.yOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 16,
      left: 16,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: max(0, -yOffset)),
          child: _FluentToastDraggableDismissWrapper(
            onDismiss: () {
              FluentToastOverlayEntry.of(context).remove();
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
