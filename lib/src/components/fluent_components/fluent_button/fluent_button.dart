import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/src/components/conditional_parent_widget/conditional_parent_widget.dart';

part 'fluent_button_style_variants/fluent_button_default_style.dart';

part 'fluent_button_style_variants/build_fluent_button_accent_style.dart';

part 'fluent_button_style_variants/build_fluent_button_outline_accent_style.dart';

part 'fluent_button_style_variants/build_fluent_button_outline_style.dart';

part 'fluent_button_style_variants/build_fluent_button_subtle_style.dart';

class FluentButton extends StatelessWidget {
  final bool isFullWidget;
  final FluentButtonVariant variant;
  final FluentButtonSize size;
  final String title;
  final Icon? icon;
  final void Function()? onPressed;
  final MaterialStateProperty<Color?>? backgroundColor;

  const FluentButton({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.isFullWidget = false,
    this.variant = FluentButtonVariant.accent,
    this.size = FluentButtonSize.medium,
    this.backgroundColor,
  });

  returnButtonTextStyle({size, fluentTheme}) {
    return switch (size) {
      FluentButtonSize.small =>
        fluentTheme.fluentTextTheme?.caption1Strong?.fluentCopyWith(
          fluentColor: Colors.white,
        ),
      FluentButtonSize.medium =>
        fluentTheme.fluentTextTheme?.caption1Strong?.fluentCopyWith(
          fluentColor: Colors.white,
        ),
      FluentButtonSize.large =>
        fluentTheme.fluentTextTheme?.body1Strong?.fluentCopyWith(
          fluentColor: Colors.white,
        ),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;

    return ConditionalParentWidget(
      condition: isFullWidget,
      parentBuilder: (context, child) => FluentContainer(
        width: double.infinity,
        child: child,
      ),
      child: ElevatedButton(
        style: getStyle(
          buttonSize: size,
          buttonVariant: variant,
          backgroundColor: backgroundColor,
          context: context,
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon,
              SizedBox(
                width: size == FluentButtonSize.small
                    ? FluentSize.size40.value
                    : FluentSize.size80.value,
              ),
            ],
            FluentText(
              title,
            )
          ],
        ),
      ),
    );
  }
}

enum FluentButtonVariant {
  accent,
  outlineAccent,
  outline,
  subtle,
}

enum FluentButtonSize { large, medium, small }

class FluentButtonStyle {
  final FluentButtonSize size;
  final MaterialStateProperty<Color?>? backgroundColor;

  FluentButtonStyle({
    required this.size,
    this.backgroundColor,
  });
}

ButtonStyle getStyle({
  required FluentButtonVariant buttonVariant,
  required FluentButtonSize buttonSize,
  required BuildContext context,
  MaterialStateProperty<Color?>? backgroundColor,
}) {
  return switch (buttonVariant) {
    FluentButtonVariant.accent => _buildFluentButtonAccentStyle(
        FluentButtonStyle(size: buttonSize, backgroundColor: backgroundColor),
        context),
    FluentButtonVariant.outlineAccent => _buildFluentButtonOutlineAccentStyle(
        FluentButtonStyle(size: buttonSize, backgroundColor: backgroundColor),
        context),
    FluentButtonVariant.outline => _buildFluentButtonOutlineStyle(
        FluentButtonStyle(size: buttonSize, backgroundColor: backgroundColor),
        context),
    FluentButtonVariant.subtle => _buildFluentButtonSubtleStyle(
        FluentButtonStyle(size: buttonSize, backgroundColor: backgroundColor),
        context),
  };
}
