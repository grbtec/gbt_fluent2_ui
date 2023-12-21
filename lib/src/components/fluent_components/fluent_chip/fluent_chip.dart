import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentChip extends StatelessWidget {
  final Widget? avatar;
  final Widget? icon;
  final FluentChipColor chipColor;
  final FluentChipColorStyle chipColorsStyle;
  final String text;

  const FluentChip.person({
    super.key,
    this.avatar,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  }) : icon = null;

  const FluentChip.icon({
    super.key,
    required this.icon,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  }) : avatar = null;

  const FluentChip.none({
    super.key,
    required this.text,
    required this.chipColor,
    required this.chipColorsStyle,
  })  : avatar = null,
        icon = null;

  @override
  Widget build(BuildContext context) {
    final textColor = switch (chipColorsStyle) {
      FluentChipColorStyle.tint => switch (chipColor) {
          FluentChipColor.brand => Theme.of(context).primaryColor,
          FluentChipColor.danger => FluentColors.statusDangerForeground1Rest,
          FluentChipColor.severe => FluentColors.statusSevereForeground1Rest,
          FluentChipColor.warning => FluentColors.statusWarningForeground1Rest,
          FluentChipColor.success => FluentColors.statusSuccessForeground1Rest,
          FluentChipColor.neutral => FluentColors.neutralForeground2Rest,
        },
      FluentChipColorStyle.filled => chipColor == FluentChipColor.neutral
          ? FluentColors.neutralForeground1Rest
          : FluentColors.neutralForegroundStaticLight,
      FluentChipColorStyle.disabled => FluentColors.neutralForegroundDisabled1,
    };
    final backgroundColor = switch (chipColorsStyle) {
      FluentChipColorStyle.tint => switch (chipColor) {
          FluentChipColor.brand =>
            ColorTween(begin: Theme.of(context).primaryColor, end: Colors.white)
                .lerp(0.7),
          FluentChipColor.danger => FluentColors.statusDangerBackground1Rest,
          FluentChipColor.severe => FluentColors.statusSevereBackground1Rest,
          FluentChipColor.warning => FluentColors.statusWarningBackground1Rest,
          FluentChipColor.success => FluentColors.statusSuccessBackground1Rest,
          FluentChipColor.neutral => FluentColors.neutralBackground5Rest,
        },
      FluentChipColorStyle.filled => switch (chipColor) {
          FluentChipColor.brand =>Theme.of(context).primaryColor,
          FluentChipColor.danger => FluentColors.statusDangerBackground2Rest,
          FluentChipColor.severe => FluentColors.statusSevereBackground2Rest,
          FluentChipColor.warning => FluentColors.statusWarningBackground2Rest,
          FluentChipColor.success => FluentColors.statusSuccessBackground2Rest,
          FluentChipColor.neutral => FluentColors.neutralBackground5Selected,
        },
      FluentChipColorStyle.disabled => FluentColors.neutralBackground5Rest,
    };

    final avatar = this.avatar;
    final icon = this.icon;
    return FluentContainer(
      cornerRadius: FluentCornerRadius.medium,
      color: backgroundColor,
      height: 24,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (avatar != null)
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: avatar,
                ),
              ),
            if (icon != null)
              IconTheme(
                data: IconThemeData(color: textColor, size: 16),
                child: icon,
              ),
            if (avatar != null || icon != null)
              SizedBox(
                width: 8,
              ),
            FluentText(
              text,
              style: GbtFluentThemeData.of(context)
                  .fluentTextTheme
                  ?.body2
                  ?.fluentCopyWith(
                    fluentColor: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

enum FluentChipColor {
  brand,
  danger,
  severe,
  warning,
  success,
  neutral,
}

enum FluentChipColorStyle {
  tint,
  filled,
  disabled,
}
