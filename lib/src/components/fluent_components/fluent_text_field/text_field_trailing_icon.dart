import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class TextFieldTrailingIcon extends StatelessWidget {
  final void Function() onTapCancelIcon;
  final Widget? suffixIcon;
  final bool isNotEmpty;
  final bool hasFocus;

  TextFieldTrailingIcon({
    super.key,
    required this.hasFocus,
    required this.isNotEmpty,
    required this.onTapCancelIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final suffixIcon = this.suffixIcon;

    final Widget trailingWidget = suffixIcon != null
        ? IconTheme(
            data: IconThemeData(
              size: FluentSize.size240.value,
              color: colorMode(
                FluentColors.neutralForeground2Rest,
                FluentDarkColors.neutralForeground2Rest,
              ),
            ),
            child: suffixIcon,
          )
        : SizedBox();

    return FluentContainer(
      child: isNotEmpty && hasFocus
          ? GestureDetector(
              onTap: onTapCancelIcon,
              child: Icon(
                Icons.cancel,
                size: FluentSize.size200.value,
                color: colorMode(
                  FluentColors.neutralForeground3Rest,
                  FluentDarkColors.neutralForeground3Rest,
                ),
              ),
            )
          : trailingWidget,
    );
  }
}
