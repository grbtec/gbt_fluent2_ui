part of 'fluent_toast.dart';

class _FluentToastDraggableDismissWrapper extends StatefulWidget {
  final void Function() onDismiss;
  final Widget child;

  const _FluentToastDraggableDismissWrapper({
    required this.onDismiss,
    required this.child,
  });

  @override
  State<_FluentToastDraggableDismissWrapper> createState() =>
      _FluentToastDraggableDismissWrapperState();
}

class _FluentToastDraggableDismissWrapperState
    extends State<_FluentToastDraggableDismissWrapper>
    with TickerProviderStateMixin {
  double x = 0;
  final Duration _animationDuration = Duration(milliseconds: 300);
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
  }

  void _onDismiss() {
    _animationController.animateTo(1).whenComplete(() {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          x += details.delta.dx;
        });
      },
      onPanEnd: (details) {
        if (x > 100 || x < -100) {
          _onDismiss();
          return;
        }
        setState(() {
          x = 0;
        });
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          final isDraggingToTheRight = x > 0;
          return Transform.translate(
            offset: Offset(
              isDraggingToTheRight
                  ? _animationController.value * screenWidth
                  : _animationController.value * -screenWidth,
              0,
            ),
            child: child,
          );
        },
        child: Transform.translate(
          offset: Offset(x, 0),
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
