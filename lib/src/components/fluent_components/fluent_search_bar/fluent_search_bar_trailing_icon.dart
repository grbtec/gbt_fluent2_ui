import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_theme.dart';
import 'package:gbt_fluent2_ui/src/components/fluent_components/fluent_search_bar/cancel_icon.dart';

class FluentSearchBarTrailingIcon extends StatelessWidget {
  final void Function() onTapCancelIcon;
  final Widget icon;
  final bool isNotEmpty;
  final bool isLoading;
  final bool hasFocus;

  const FluentSearchBarTrailingIcon({
    super.key,
    required this.icon,
    required this.hasFocus,
    required this.isLoading,
    required this.isNotEmpty,
    required this.onTapCancelIcon,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;



    return FluentContainer(
      child: isNotEmpty && isLoading
          ? CancelIcon(
              isLoading: isLoading,
              onTap: onTapCancelIcon,
            )
          : hasFocus && isNotEmpty
              ? CancelIcon(
                  isLoading: isLoading,
                  onTap: onTapCancelIcon,
                )
              : IconTheme(
                      data: IconThemeData(
                        color: FluentColors.neutralForeground2Rest,
                        size: FluentSize.size200.value,
                      ),
                      child: icon,
                    ),
    );
  }
}
