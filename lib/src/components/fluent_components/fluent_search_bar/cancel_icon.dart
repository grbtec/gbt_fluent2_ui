import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class CancelIcon extends StatelessWidget {
  final bool isLoading;
  final void Function() onTap;

  const CancelIcon({
    super.key,
    this.isLoading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: FluentSize.size240.value,
          height: FluentSize.size240.value,
          child: isLoading
              ? CircularProgressIndicator(
                  color: colorMode(
                    FluentColors.neutralForeground3Rest,
                    FluentDarkColors.neutralForeground3Rest,
                  ),
                  strokeWidth: FluentStrokeThickness.strokeWidth20.value,
                )
              : null,
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.cancel,
            size: FluentSize.size200.value,
            color: colorMode(
              FluentColors.neutralForeground2Rest,
              FluentDarkColors.neutralForeground2Rest,
            ),
          ),
        )
      ],
    );
  }
}
