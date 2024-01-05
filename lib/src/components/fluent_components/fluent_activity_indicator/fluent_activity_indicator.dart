import 'dart:math';
import 'package:flutter/material.dart';

class FluentActivityIndicator extends StatefulWidget {
  final double size;
  final double? value;

  const FluentActivityIndicator({
    super.key,
    this.size = 36,
    required this.value,
  });

  @override
  State<FluentActivityIndicator> createState() =>
      _FluentActivityIndicatorState();
}

class _FluentActivityIndicatorState extends State<FluentActivityIndicator> {
  bool get loading => widget.value == null;
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SizedBox(
        width: widget.size,
        height: widget.size * 1.5,
        child: Center(
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final value = widget.value;
    if(value == null){
      return SizedBox.shrink();
    }
    return SizedBox(
      width: widget.size,
      height: min(1.5 * value * widget.size, widget.size * 2),
      child: OverflowBox(
        alignment: Alignment.center,
        minHeight: widget.size,
        maxHeight: widget.size,
        maxWidth: widget.size,
        minWidth: widget.size,
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: CircularProgressIndicator(
            value: max(0, value - 0.5) * 2,
          ),
        ),
      ),
    );
  }
}
