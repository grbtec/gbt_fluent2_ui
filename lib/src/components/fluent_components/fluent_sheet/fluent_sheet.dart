import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

part 'fluent_sheet_controller.dart';

const _headerHeight = 52.0;

class FluentSheet extends StatefulWidget {
  final FluentSheetController? controller;
  final bool half;
  final double headerHeight;
  final VoidCallback? onMinExtent;
  final VoidCallback? onMaxExtent;
  final Widget? headerLeading;
  final Widget? headerTitle;
  final Widget? headerTrailing;
  final Widget child;

  const FluentSheet.bottom({
    this.controller,
    this.half = false,
    this.headerHeight = 20,
    this.onMinExtent,
    this.onMaxExtent,
    this.headerLeading,
    this.headerTitle,
    this.headerTrailing,
    required this.child,
  }) : assert(headerHeight >= 20);

  @override
  State<FluentSheet> createState() => _FluentSheetState();
}

class _FluentSheetState extends State<FluentSheet> {
  double _lastSize = 0;
  _Direction direction = _Direction.down;
  late final FluentSheetController controller;
  double childMinSize = 0;

  double get childMaxSize => widget.half ? 0.5 : 0.99;

  bool get hasHeader =>
      widget.headerLeading != null ||
      widget.headerTitle != null ||
      widget.headerTrailing != null;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? _InternalFluentSheetController();

    controller.addListener(controllerListener);
  }

  void controllerListener() {
    final size = controller.draggableScrollableController.size;

    if (size == childMinSize) {
      widget.onMinExtent?.call();
    } else if (size >= childMaxSize) {
      widget.onMaxExtent?.call();
    }
    if (size - _lastSize > 0) {
      direction = _Direction.up;
    } else {
      direction = _Direction.down;
    }
    _lastSize = size;
  }

  void onScrollEnd() {
    if(!controller.draggableScrollableController.isAttached){
      return;
    }
    switch (direction) {
      case _Direction.up:
        controller.draggableScrollableController.animateTo(
          1,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        break;
      case _Direction.down:
        controller.draggableScrollableController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollEndNotification not) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onScrollEnd();
        });
        return false;
      },
      child: LayoutBuilder(builder: (context, constraints) {
        childMinSize = (widget.headerHeight+MediaQuery.of(context).padding.bottom) / constraints.maxHeight;
        return SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: DraggableScrollableSheet(
            controller: controller.draggableScrollableController,
            maxChildSize: childMaxSize,
            initialChildSize: childMinSize,
            minChildSize: childMinSize,
            builder: (BuildContext context, ScrollController scrollController) {
              return Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    FluentContainer(
                      shadow: GbtFluentThemeData.of(context)
                          .fluentShadowTheme
                          ?.brandShadow28,
                      cornerRadius: FluentCornerRadius.xLarge,
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(FluentCornerRadius.xLarge.value),
                          topRight:
                              Radius.circular(FluentCornerRadius.xLarge.value),
                        ),
                        child: Container(
                          color: FluentColors.neutralBackground2Rest,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: FluentContainer(
                                      cornerRadius: FluentCornerRadius.circle,
                                      width: 36,
                                      height: 4,
                                      color: FluentColors.neutralStroke1Rest,
                                    ),
                                  ),
                                ),
                                if (hasHeader)
                                  SizedBox(
                                    height: _headerHeight,
                                    child: Stack(
                                      children: [
                                        if (widget.headerLeading != null)
                                          Positioned(
                                            left: 16,
                                            child: DefaultTextStyle(
                                              style: GbtFluentThemeData.of(context)
                                                      .fluentTextTheme
                                                      ?.body1
                                                      ?.fluentCopyWith(
                                                          fluentColor: FluentColors
                                                              .neutralForeground2Rest) ??
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              child: Container(
                                                height: _headerHeight,
                                                alignment: Alignment.centerLeft,
                                                child: widget.headerLeading,
                                              ),
                                            ),
                                          ),
                                        if (widget.headerTrailing != null)
                                          Positioned(
                                            right: 16,
                                            child: DefaultTextStyle(
                                              style: GbtFluentThemeData.of(context)
                                                      .fluentTextTheme
                                                      ?.body1
                                                      ?.fluentCopyWith(
                                                          fluentColor: FluentColors
                                                              .neutralForeground2Rest) ??
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              child: Container(
                                                height: _headerHeight,
                                                alignment: Alignment.centerRight,
                                                child: widget.headerTrailing,
                                              ),
                                            ),
                                          ),
                                        if (widget.headerTitle != null)
                                          Positioned(
                                            child: DefaultTextStyle(
                                              style: GbtFluentThemeData.of(context)
                                                      .fluentTextTheme
                                                      ?.body1
                                                      ?.fluentCopyWith(
                                                          fluentColor: FluentColors
                                                              .neutralForeground1Rest) ??
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              child: Center(
                                                child: widget.headerTitle,
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                widget.child
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    if (controller is _InternalFluentSheetController) {
      controller.dispose();
    } else {
      controller.draggableScrollableController
          .removeListener(controllerListener);
    }
    super.dispose();
  }
}

enum _Direction { up, down }
