import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/src/components/fluent_components/fluent_search_bar/cancel_icon.dart';

class TextFieldTrailingIcon extends StatelessWidget {
  final void Function() onTapCancelIcon;
  final Icon? icon;
  final bool isNotEmpty;
  final bool hasFocus;

  TextFieldTrailingIcon({
    super.key,
    required this.hasFocus,
    required this.isNotEmpty,
    required this.onTapCancelIcon,
    this.icon,
  });


  Widget iconToWidget(Icon? icon) {
    if (icon != null) {
      return IconTheme(
        data: IconThemeData(
          size: FluentSize.size240.value,
          color: FluentColors.neutralForeground2Rest,
        ),
        child: icon,
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget trailingWidget = icon != null
        ? IconTheme(
      data: IconThemeData(
        size: FluentSize.size240.value,
        color: FluentColors.neutralForeground2Rest,
      ),
      child: iconToWidget(icon),
    )
        : SizedBox();

    return FluentContainer(
      child: isNotEmpty && hasFocus
          ? CancelIcon(
              onTap: onTapCancelIcon,
            )
          : trailingWidget,
    );
  }
}
