
import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class _RenderInnerAspectRatio extends RenderProxyBox {
  _RenderInnerAspectRatio({
    required double aspectRatio,
  }) : _aspectRatio = aspectRatio;

  double get aspectRatio => _aspectRatio;
  double _aspectRatio;

  set aspectRatio(double value) {
    if (_aspectRatio != value) {
      _aspectRatio = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    child?..layout(constraints, parentUsesSize: true);
    final childSize = child?.size ?? Size.zero;
    final sideLength = max(childSize.width, childSize.height);
    final widthDiff = sideLength - childSize.width;
    final heightDiff = sideLength - childSize.height;
    final double width;
    final double height;
    if (widthDiff > 0) {
      width = sideLength * aspectRatio;
      height = sideLength;
    } else if (heightDiff > 0) {
      width = sideLength;
      height = sideLength / aspectRatio;
    } else {
      width = sideLength;
      height = sideLength;
    }
    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final childSize = child?.size ?? Size.zero;
    final sideLength = max(childSize.width, childSize.height);
    final widthDiff = sideLength - childSize.width;
    final heightDiff = sideLength - childSize.height;
    final double width;
    final double height;
    if (widthDiff > 0) {
      width = sideLength * aspectRatio;
      height = sideLength;
    } else if (heightDiff > 0) {
      width = sideLength;
      height = sideLength / aspectRatio;
    } else {
      width = sideLength;
      height = sideLength;
    }
    final finalWidthDiff = width - childSize.width;
    final finalHeightDiff = height - childSize.height;
    super.paint(
        context, Offset(offset.dx + finalWidthDiff / 2, offset.dy + finalHeightDiff / 2));
  }
}

class InnerAspectRatio extends SingleChildRenderObjectWidget {
  final double aspectRatio;

  const InnerAspectRatio({
    required this.aspectRatio,
    super.child,
    Key? key,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInnerAspectRatio(aspectRatio: aspectRatio);
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerAspectRatio renderObject) {
    renderObject.aspectRatio = aspectRatio;
  }
}
