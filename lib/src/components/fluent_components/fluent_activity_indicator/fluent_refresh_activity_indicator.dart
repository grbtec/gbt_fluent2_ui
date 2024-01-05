import 'package:flutter/material.dart';

class FluentRefreshActivityIndicator extends StatefulWidget {
  final void Function() onRefresh;
  final Widget Function(BuildContext context, double value)
      activityIndicatorBuilder;
  final Widget child;

  const FluentRefreshActivityIndicator({
    super.key,
    required this.onRefresh,
    required this.activityIndicatorBuilder,
    required this.child,
  });

  @override
  State<FluentRefreshActivityIndicator> createState() =>
      _FluentRefreshActivityIndicatorState();
}

class _FluentRefreshActivityIndicatorState
    extends State<FluentRefreshActivityIndicator> {
  final ValueNotifier<double?> overscroll = ValueNotifier(0);
  static const double _swipeOffset = 100;
  bool? isSmooth;

  // iOS
  bool _handleScrollNotification(ScrollUpdateNotification notification) {
    if (overscroll.value == null || isSmooth == false) {
      return false;
    }
    final pixels = notification.metrics.pixels;
    if (pixels > 0) {
      overscroll.value = 0;
    } else {
      isSmooth = true;
      overscroll.value = -pixels * 5;
    }
    return false;
  }

  // Android
  bool _handleOverscrollNotification(OverscrollNotification notification) {
    if (isSmooth == null) {
      isSmooth = false;
    } else if (isSmooth == true) {
      return false;
    }
    if (notification.overscroll < 0) {
      var value = overscroll.value ?? 0;
      value -= notification.overscroll;
      overscroll.value = value;
    }
    return false;
  }

  bool _handleScrollEndNotification(ScrollEndNotification notification) {
    if (overscroll.value == null) {
      return false;
    }
    if ((overscroll.value ?? 0) >= _swipeOffset) {
      overscroll.value = null;
      widget.onRefresh();
    } else if (isSmooth == false) {
      overscroll.value = 0;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleScrollNotification,
      child: NotificationListener(
        onNotification: _handleOverscrollNotification,
        child: NotificationListener(
          onNotification: _handleScrollEndNotification,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: ValueListenableBuilder(
                    valueListenable: overscroll,
                    builder: (context, value, __) {
                      if (value == 0 || value == null) {
                        return SizedBox.shrink();
                      }
                      return widget.activityIndicatorBuilder(
                        context,
                        value / _swipeOffset,
                      );
                    },
                  ),
                ),
              ];
            },
            body: widget.child,
          ),
        ),
      ),
    );
  }
}
