part of 'dotted_border.dart';

typedef PathBuilder = Path Function(Size);

/// [DashedPainter] is a custom painter that draws a dashed line around the
/// [avatar] widget. The [strokeWidth] property defines the width of the dashed
/// border and [color] determines the stroke paint color. [CircularIntervalList]
/// is populated with the [dashPattern] to render the appropriate pattern. The
/// [radius] property is taken into account only if the [borderType] is
/// [BorderType.RRect]. A [customPath] can be passed in as a parameter if you
/// want to draw a custom shaped border.
class DashedPainter extends CustomPainter {
  final double strokeWidth;
  final List<double> dashPattern;
  final Color color;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;
  final EdgeInsets padding;

  DashedPainter({
    this.strokeWidth = 2,
    this.dashPattern = const <double>[3, 1],
    this.color = Colors.black,
    this.borderType = BorderType.Rect,
    this.radius = const Radius.circular(0),
    this.strokeCap = StrokeCap.butt,
    this.customPath,
    this.padding = EdgeInsets.zero,
  }) {
    assert(dashPattern.isNotEmpty, 'Dash Pattern cannot be empty');
  }

  @override
  void paint(Canvas canvas, Size originalSize) {
    final Size size;
    if (padding == EdgeInsets.zero) {
      size = originalSize;
    } else {
      canvas.translate(padding.left, padding.top);
      size = Size(
        originalSize.width - padding.horizontal,
        originalSize.height - padding.vertical,
      );
    }

    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    Path _path;
    if (customPath != null) {
      _path = _dashPath(
        customPath!(size),
        dashArray: _CircularIntervalList(dashPattern),
      );
    } else {
      _path = _getPath(size);
    }

    canvas.drawPath(_path, paint);
  }

  /// Returns a [Path] based on the the [borderType] parameter
  Path _getPath(Size size) {
    Path path;
    switch (borderType) {
      case BorderType.Circle:
        path = _getCirclePath(size);
        break;
      case BorderType.RRect:
        path = _getRRectPath(size, radius);
        break;
      case BorderType.Rect:
        path = _getRectPath(size);
        break;
      case BorderType.Oval:
        path = _getOvalPath(size);
      case BorderType.Line:
        path = _getLinePath(size);
        break;
    }

    return _dashPath(path, dashArray: _CircularIntervalList(dashPattern));
  }

  /// Returns a circular path of [size]
  Path _getCirclePath(Size size) {
    double w = size.width;
    double h = size.height;
    double s = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w > s ? (w - s) / 2 : 0,
            h > s ? (h - s) / 2 : 0,
            s,
            s,
          ),
          Radius.circular(s / 2),
        ),
      );
  }

  /// Returns a Rounded Rectangular Path with [radius] of [size]
  Path _getRRectPath(Size size, Radius radius) {
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          radius,
        ),
      );
  }

  /// Returns a path of [size]
  Path _getRectPath(Size size) {
    return Path()
      ..addRect(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );
  }

  /// Return an oval path of [size]
  Path _getOvalPath(Size size) {
    return Path()
      ..addOval(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
      );
  }

  /// Return an line path of [size]
  Path _getLinePath(Size size) {
    // return Path()..addPath(path, Offset.zero);
    return Path()
    ..moveTo(0, size.height/2)
      ..lineTo(size.width, size.height /2 );

  }

  @override
  bool shouldRepaint(DashedPainter oldDelegate) {
    return oldDelegate.strokeWidth != this.strokeWidth ||
        oldDelegate.color != this.color ||
        oldDelegate.dashPattern != this.dashPattern ||
        oldDelegate.padding != this.padding ||
        oldDelegate.borderType != this.borderType;
  }
}


Path _dashPath(
    Path source, {
      required _CircularIntervalList<double> dashArray,
    }) {
  assert(dashArray != null); // ignore: unnecessary_null_comparison

  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = 0;
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashArray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }

  return dest;
}

class _CircularIntervalList<T> {
  _CircularIntervalList(this._vals);

  final List<T> _vals;
  int _idx = 0;

  T get next {
    if (_idx >= _vals.length) {
      _idx = 0;
    }
    return _vals[_idx++];
  }
}