import 'package:flutter/widgets.dart';

class ConditionalParentWidget extends StatefulWidget {
  const ConditionalParentWidget({
    Key? key,
    required this.condition,
    required this.child,
    required this.parentBuilder,
  }) : super(key: key);

  final Widget child;
  final bool condition;
  final Widget Function(BuildContext context, Widget child) parentBuilder;

  @override
  State<ConditionalParentWidget> createState() =>
      _ConditionalParentWidgetState();
}

class _ConditionalParentWidgetState extends State<ConditionalParentWidget> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: key, child: widget.child);
    return widget.condition ? this.widget.parentBuilder(context, child) : child;
  }
}
