import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentSwitchToggle extends StatelessWidget {
  final bool value;
  final void Function(bool value)? onChanged;

  const FluentSwitchToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: FluentColors.of(context)?.brandBackground1Rest,
      trackColor: colorMode(
        FluentColors.neutralBackground5Rest,
        FluentDarkColors.neutralBackground5Rest,
      ),
    );
  }
}
