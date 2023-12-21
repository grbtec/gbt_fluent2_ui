import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_theme.dart';

class FluentSectionHeader extends StatelessWidget {
  final IconData? titleIcon;
  final FluentSectionHeaderActions? actions;
  final String title;
  final SectionHeaderTitleVariant? titleVariant;
  final Color? backgroundColor;

  /// FluentSectionHeader's constructor
  const FluentSectionHeader({
    required this.title,
    super.key,
    this.actions,
    this.titleIcon,
    this.backgroundColor,
    this.titleVariant = SectionHeaderTitleVariant.bold,
  });

  @override
  Widget build(BuildContext context) {
    final actions = this.actions;
    final action1 = actions?.action1;
    final action2 = actions?.action2;

    return FluentContainer(
      color: backgroundColor,
      height: FluentSize.size480.value,
      padding: EdgeInsets.only(
        left: FluentSize.size160.value,
        right: FluentSize.size160.value,
        bottom: FluentSize.size80.value,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              if (titleIcon != null) ...[
                Icon(
                  titleIcon,
                  size: FluentSize.size240.value,
                  color: FluentColors.neutralForeground3Rest,
                ),
                SizedBox(width: FluentSize.size80.value),
              ],
              FluentText(
                title,
                style: titleVariant == SectionHeaderTitleVariant.bold
                    ? GbtFluentThemeData.of(context)
                        .fluentTextTheme
                        ?.body1Strong
                        ?.fluentCopyWith(
                          fluentColor: FluentColors.neutralForeground1Rest,
                        )
                    : GbtFluentThemeData.of(context)
                        .fluentTextTheme
                        ?.caption1
                        ?.fluentCopyWith(
                          fluentColor: FluentColors.neutralForeground2Rest,
                        ),
              ),
            ],
          ),
          if (actions != null)
            Row(
              children: [
                if (action1 != null) ...[
                  if (action1 is Icon)
                    IconTheme(
                        data: IconThemeData(size: FluentSize.size200.value),
                        child: action1)
                  else
                    action1,
                ],
                SizedBox(width: FluentSize.size200.value),
                if (action2 != null) ...[
                  if (action2 is Icon)
                    IconTheme(
                        data: IconThemeData(size: FluentSize.size200.value),
                        child: action2)
                  else
                    action2,
                ]
              ],
            ),
        ],
      ),
    );
  }
}

class FluentSectionHeaderActions {
  final Widget action1;
  final Widget? action2;

  final List<Widget?> value;

  /// FluentSectionHeaderActions's constructor
  FluentSectionHeaderActions({
    required this.action1,
    this.action2,
  }) : value = [action1, action2];
}

enum SectionHeaderTitleVariant { bold, subtle }
