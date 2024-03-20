import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

part 'fluent_toast_color.dart';

part 'fluent_toast_wrapper.dart';

part 'fluent_toast_overlay_entry.dart';

part 'fluent_toast_dismiss_button.dart';

part 'fluent_toast_draggable_dismiss_wrapper.dart';

part 'fluent_toast_animation.dart';

class FluentToast extends StatefulWidget {
  final FluentToastColor toastColor;
  final String text;
  final String? subText;
  final Widget? icon;
  final Widget? action;

  const FluentToast({
    super.key,
    required this.text,
    this.toastColor = FluentToastColor.neutral,
    this.subText,
    this.icon,
    this.action,
  });

  @override
  State<FluentToast> createState() => _FluentToastState();

  void show({
    required BuildContext context,
    Duration? duration = const Duration(seconds: 3),
    double yOffset = -64,
    VoidCallback? onDismissed,
  }) {
    _showOverlay(
      context,
      duration,
      yOffset,
      onDismissed,
      this,
    );
  }

  static void showToast({
    required BuildContext context,
    required String text,
    String? subText,
    Widget? icon,
    Widget? action,
    Duration? duration = const Duration(seconds: 3),
    double yOffset = -64,
    VoidCallback? onDismissed,
  }) async {
    _showOverlay(
      context,
      duration,
      yOffset,
      onDismissed,
      FluentToast(
        toastColor: FluentToastColor.neutral,
        text: text,
        subText: subText,
        icon: icon,
        action: action,
      ),
    );
  }

  static void _showOverlay(
    BuildContext context,
    Duration? duration,
    double yOffset,
    VoidCallback? onDismissed,
    FluentToast child,
  ) {
    List<Timer> timers = [];
    void onDismissedProxy() {
      for (final timer in timers) {
        timer.cancel();
      }
      onDismissed?.call();
    }

    final fluentToastAnimationController = _FluentToastAnimationController();
    // final List<OverlayEntry> entries = [];
    final overlay = Overlay.of(context);
    final overlayEntry = FluentToastOverlayEntry(
      yOffset: yOffset - MediaQuery.of(overlay.context).viewInsets.bottom,
      onDismissed: onDismissedProxy,
      child: _FluentToastAnimation(
        controller: fluentToastAnimationController,
        child: child,
      ),
    );
    // entries.add(overlayEntry);

    overlay.insert(overlayEntry);

    if (duration != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        timers.add(Timer(
            duration - fluentToastAnimationController.animationDuration, () {
          fluentToastAnimationController.close();
        }));
      });
      timers.add(Timer(duration, () {
        overlayEntry.remove();
      }));
    }
  }
}

class _FluentToastState extends State<FluentToast> {
  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final subText = widget.subText;
    final icon = widget.icon;
    final action = widget.action;
    final textColor = switch (widget.toastColor) {
      FluentToastColor.accent =>
        FluentColors.of(context)?.brandForegroundTintRest,
      FluentToastColor.warning => colorMode(
          FluentColors.statusWarningForeground1Rest,
          FluentDarkColors.statusWarningForeground1Rest,
        ),
      FluentToastColor.danger => colorMode(
          FluentColors.statusDangerForeground1Rest,
          FluentDarkColors.statusDangerForeground1Rest,
        ),
      FluentToastColor.neutral => colorMode(
          FluentColors.neutralForeground1Rest,
          FluentDarkColors.neutralForeground1Rest,
        ),
    };
    final subTextColor = switch (widget.toastColor) {
      FluentToastColor.accent =>
        FluentColors.of(context)?.brandForegroundTintRest,
      FluentToastColor.warning => colorMode(
          FluentColors.statusWarningForeground1Rest,
          FluentDarkColors.statusWarningForeground1Rest,
        ),
      FluentToastColor.danger => colorMode(
          FluentColors.statusDangerForeground1Rest,
          FluentDarkColors.statusDangerForeground1Rest,
        ),
      FluentToastColor.neutral => colorMode(
          FluentColors.neutralForeground2Rest,
          FluentDarkColors.neutralForeground2Rest,
        ),
    };
    return SizedBox(
      height: widget.subText != null ? 64 : 52,
      child: Material(
        color: Colors.transparent,
        child: FluentContainer(
          cornerRadius: FluentCornerRadius.xLarge,
          shadow: switch (widget.toastColor) {
            FluentToastColor.accent =>
              FluentThemeDataModel.of(context).fluentShadowTheme?.brandShadow16,
            _ => FluentThemeDataModel.of(context).fluentShadowTheme?.shadow16
          },
          color: switch (widget.toastColor) {
            FluentToastColor.accent =>
              FluentColors.of(context)?.brandBackgroundTintRest,
            FluentToastColor.warning => colorMode(
                FluentColors.statusWarningBackground1Rest,
                FluentDarkColors.statusWarningBackground1Rest,
              ),
            FluentToastColor.danger => colorMode(
                FluentColors.statusDangerBackground1Rest,
                FluentDarkColors.statusDangerBackground1Rest,
              ),
            FluentToastColor.neutral => colorMode(
                FluentColors.neutralBackground4Rest,
                FluentDarkColors.neutralBackground4Rest,
              ),
          },
          child:
              // unnecessary
              SizedBox(
            height: widget.subText != null ? 64 : 52,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (icon != null) ...[
                    IconTheme(
                      data: IconThemeData(
                        color: subTextColor,
                      ),
                      child: icon,
                    ),
                    Padding(padding: EdgeInsets.only(right: 16)),
                  ],
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentText(
                          widget.text,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.body2Strong
                              ?.fluentCopyWith(
                                fluentColor: textColor,
                              ),
                        ),
                        if (subText != null)
                          FluentText(
                            subText,
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.body2
                                ?.fluentCopyWith(
                                  fluentColor: subTextColor,
                                ),
                          )
                      ],
                    ),
                  ),
                  if (action != null)
                    IconTheme(
                      data: IconThemeData(
                        color: subTextColor,
                      ),
                      child: action,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
