// TODO: ________ ALWAYS USE MIXEDS HERE  ________________________

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/src/fluent_with_material/mixed_fluent_stroke_style.dart';
import 'package:gbt_fluent2_ui/src/fluent_with_material/mixed_fluent_stroke_theme.dart';

final theme = getTheme(
  brandColor: MaterialColor(
    0XFF2886DE,
    <int, Color>{
      50: Color(0XFF0C3B5E),
      100: Color(0XFF0E4775),
      200: Color(0XFF0F548C),
      300: Color(0XFF115EA3),
      400: Color(0XFF0F6CBD),
      500: Color(0XFF2886DE),
      700: Color(0XFFB4D6FA),
      800: Color(0XFFCFE4FA),
    },
  ),
);

GbtFluentThemeData getTheme({
  required MaterialColor brandColor,
}) {
  final fluentColors = convert(brandColor);

  return GbtFluentThemeData(
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    useMaterial3: true,
    fontFamily:
        defaultTargetPlatform == TargetPlatform.iOS ? 'SF Pro' : 'Roboto',
    fluentBrandColors: fluentColors,
    fluentTextTheme: MixedFluentTextTheme(
      caption2: MixedFluentTextStyle(
        fluentSize: 12,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      caption1: MixedFluentTextStyle(
        fluentSize: 13,
        fluentLineHeight: 1.4,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      caption1Strong: MixedFluentTextStyle(
        fluentSize: 13,
        fluentLineHeight: 1.4,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      body2: MixedFluentTextStyle(
        fluentSize: 15,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      body2Strong: MixedFluentTextStyle(
        fluentSize: 15,
        fluentLineHeight: 1.35,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      body1: MixedFluentTextStyle(
        fluentSize: 17,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      body1Strong: MixedFluentTextStyle(
        fluentSize: 17,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      title3: MixedFluentTextStyle(
        fluentSize: 20,
        fluentLineHeight: 1.25,
        fluentWeight: MixedFluentFontWeight.regular,
      ),
      title2: MixedFluentTextStyle(
        fluentSize: 22,
        fluentLineHeight: 1.3,
        fluentWeight: MixedFluentFontWeight.semibold,
      ),
      title1: MixedFluentTextStyle(
        fluentSize: 28,
        fluentLineHeight: 1.22,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
      largeTitle: MixedFluentTextStyle(
        fluentSize: 34,
        fluentLineHeight: 1.21,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
      display: MixedFluentTextStyle(
        fluentSize: 60,
        fluentLineHeight: 1.17,
        fluentWeight: MixedFluentFontWeight.bold,
      ),
    ),
    fluentShadowTheme: MixedFluentShadowTheme(
      shadow2: MixedFluentShadow.lowElevation(2),
      shadow4: MixedFluentShadow.lowElevation(4),
      shadow8: MixedFluentShadow.lowElevation(8),
      shadow16: MixedFluentShadow.lowElevation(16),
      shadow28: MixedFluentShadow.hightElevation(28),
      shadow64: MixedFluentShadow.hightElevation(64),
      brandShadow2:
          MixedFluentShadow.brandColor(2, brandColor, ElevationRamp.low),
      brandShadow4:
          MixedFluentShadow.brandColor(4, brandColor, ElevationRamp.low),
      brandShadow8:
          MixedFluentShadow.brandColor(8, brandColor, ElevationRamp.low),
      brandShadow16:
          MixedFluentShadow.brandColor(16, brandColor, ElevationRamp.low),
      brandShadow28:
          MixedFluentShadow.brandColor(28, brandColor, ElevationRamp.hight),
      brandShadow64:
          MixedFluentShadow.brandColor(64, brandColor, ElevationRamp.hight),
    ),
    fluentStrokeTheme: MixedFluentStrokeTheme(
      stroke1: MixedFluentStrokeStyle(
        color: FluentColors.neutralStroke1Rest,
        thickness: FluentStrokeThickness.strokeWidth05,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      stroke2: MixedFluentStrokeStyle(
        color: FluentColors.neutralStroke2Rest,
        thickness: FluentStrokeThickness.strokeWidth05,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      strokeAccessible: MixedFluentStrokeStyle(
        color: FluentColors.neutralStrokeAccessibleRest,
        thickness: FluentStrokeThickness.strokeWidth10,
        cornerRadius: MixedFluentCornerRadius.none,
      ),
      strokeDisabled: MixedFluentStrokeStyle(
        color: FluentColors.neutralStrokeDisabledRest,
        thickness: FluentStrokeThickness.strokeWidth10,
        cornerRadius: MixedFluentCornerRadius.xLarge,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: brandColor),
  );
}

FluentColors convert(MaterialColor colors) {
  return FluentColors(
    brandBackground1Rest: colors[400]!,
    brandBackground1Pressed: colors[100]!,
    brandBackground1Selected: colors[200]!,
    brandBackground2Rest: colors[300]!,
    brandBackground2Pressed: colors[50]!,
    brandBackground2Selected: colors[50]!,
    brandBackground3Rest: colors[200]!,
    brandBackgroundTint: colors[800]!,
    brandBackgroundDisabledRest: colors[700]!,
    brandForeground1Rest: colors[400]!,
    brandForeground1Pressed: colors[100]!,
    brandForeground1Selected: colors[200]!,
    brandForegroundTint: colors[200]!,
    brandForegroundDisabled1Rest: colors[500]!,
    brandForegroundDisabled2Rest: colors[700]!,
    brandStroke1Rest: colors[400]!,
    brandStroke1Pressed: colors[100]!,
    brandStroke1Selected: colors[200]!,
  );
}
