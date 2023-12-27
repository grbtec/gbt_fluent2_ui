import 'dart:ui';

import 'package:gbt_fluent2_ui/src/fluent_models/fluent_font_weight.dart';

abstract interface class FluentTextStyle {
  final double? fluentSize;
  final double? fluentLineHeight;
  final FluentFontWeight? fluentWeight;
  final Color? fluentColor;

  /// FluentTextStyle's constructor
  FluentTextStyle({
    this.fluentSize,
    this.fluentLineHeight,
    this.fluentWeight,
    this.fluentColor,
  });

  FluentTextStyle fluentCopyWith({
    double? fluentSize,
    double? fluentLineHeight,
    FluentFontWeight? fluentWeight,
    Color? fluentColor,
  });
}
