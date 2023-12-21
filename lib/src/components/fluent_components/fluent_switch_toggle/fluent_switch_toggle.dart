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
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
      trackColor: FluentColors.neutralBackground5Rest,
    );
  }
}
