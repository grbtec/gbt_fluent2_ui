import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/src/fluent_models/fluent_text_style.dart';
import 'package:gbt_fluent2_ui/src/fluent_with_material/mixed_fluent_text_style.dart';

class FluentText extends StatelessWidget {
  final String data;
  final FluentTextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextHeightBehavior? textHeightBehavior;
  final Locale? locale;
  final bool? softWrap;
  final double? textScaleFactor;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final StrutStyle? strutStyle;


  /// FluentText's constructor
  const FluentText(
    this.data, {
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.textOverflow,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.semanticsLabel,
    this.softWrap,
    this.selectionColor,
    this.locale,
    this.textScaleFactor,
    this.strutStyle,
  });

  @override
  Widget build(BuildContext context) {
    final style = this.style;
    return Text(
      data,
      style: style as MixedFluentTextStyle?,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: textOverflow,
      textHeightBehavior: textHeightBehavior,
      locale: locale,
      selectionColor: selectionColor,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textScaleFactor: textScaleFactor,
      strutStyle: strutStyle,
    );
  }
}
