part of 'fluent_toast.dart';

class _FluentToastAnimation extends StatefulWidget {
  final Widget child;
  final _FluentToastAnimationController controller;

  const _FluentToastAnimation({
    required this.controller,
    required this.child,
  });

  @override
  State<_FluentToastAnimation> createState() => _FluentToastAnimationState();
}

class _FluentToastAnimationState extends State<_FluentToastAnimation> {
  double animationValue = 1;

  @override
  void initState() {
    super.initState();
    widget.controller.attachCloseCallback(onClose);
  }

  Future<void> onClose() async {
    setState(() {
      animationValue = 0;
    });
    await Future.delayed(widget.controller.animationDuration);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0, end: animationValue),
      duration: widget.controller.animationDuration,
      builder: (_, value, child) {
        final xOffset = MediaQuery.of(context).size.width * (1 - value);
        return Transform.translate(
          offset: Offset(xOffset, 0),
          child: widget.child,
        );
      },
    );
  }
}

class _FluentToastAnimationController {
  final Duration animationDuration = Duration(milliseconds: 300);
  bool _attached = false;
  late Future<void> Function() _attachedClose;
  Future<void> Function() get close => _attachedClose;

  _FluentToastAnimationController();

  void attachCloseCallback(Future<void> Function() closeCallback) {
    if (_attached) {
      throw "close callback can only be attached once. Make sure it's called in initState()";
    }
    _attached = true;
    _attachedClose = closeCallback;
  }
}
