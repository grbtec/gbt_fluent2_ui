import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/src/fluent_models/fluent_font_weight.dart';
import 'package:gbt_fluent2_ui/src/fluent_models/fluent_text_style.dart';
import 'package:gbt_fluent2_ui/src/fluent_with_material/mixed_fluent_font_weight.dart';

class MixedFluentTextStyle extends TextStyle implements FluentTextStyle {
  @override
  final double? fluentLineHeight;

  @override
  final double? fluentSize;

  @override
  final MixedFluentFontWeight? fluentWeight;

  @override
  final Color? fluentColor;

  @override
  MixedFluentTextStyle fluentCopyWith({
    double? fluentSize,
    double? fluentLineHeight,
    FluentFontWeight? fluentWeight,
    Color? fluentColor,
  }) {
    return MixedFluentTextStyle(
        fluentWeight: fluentWeight == null
            ? this.fluentWeight
            : MixedFluentFontWeight.values[fluentWeight.index],
        fluentSize: fluentSize ?? this.fluentSize,
        fluentColor: fluentColor ?? this.fluentColor,
        fluentLineHeight: fluentLineHeight ?? this.fluentLineHeight);
  }

  /// CustomFluentTextStyle's constructor
  MixedFluentTextStyle({
    this.fluentWeight,
    this.fluentLineHeight,
    this.fluentSize,
    this.fluentColor,
  }) : super(
          height: fluentLineHeight,
          fontSize: fluentSize,
          fontWeight: fluentWeight?.fontWeight,
          color: fluentColor,
        );
}
