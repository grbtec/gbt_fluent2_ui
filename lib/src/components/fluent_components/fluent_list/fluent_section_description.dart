import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentSectionDescription extends StatelessWidget {
  final IconData? icon;
  final String description;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;

  /// FluentSectionDescription's constructor
  const FluentSectionDescription({
    required this.description,
    super.key,
    this.icon,
    this.backgroundColor,
    this.padding,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final icon = this.icon;
    return FluentContainer(
      color: backgroundColor,
      width: double.infinity,
      padding: padding ??
          EdgeInsets.only(
            top: FluentSize.size240.value,
            right: FluentSize.size160.value,
            bottom: FluentSize.size80.value,
            left: FluentSize.size160.value,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: FluentSize.size160.value,
              color: foregroundColor ??
                  colorMode(
                    FluentColors.neutralForeground2Rest,
                    FluentDarkColors.neutralForeground2Rest,
                  ),
            ),
          if (icon != null)
            SizedBox(
              width: FluentSize.size160.value,
            ),
          Expanded(
            child: FluentText(
              description,
              style: FluentThemeDataModel.of(context)
                  .fluentTextTheme
                  ?.caption1
                  ?.fluentCopyWith(
                    fluentColor: foregroundColor ??
                        colorMode(
                          FluentColors.neutralForeground2Rest,
                          FluentDarkColors.neutralForeground2Rest,
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
