import 'package:gbt_fluent2_ui/src/fluent_models/fluent_shadow_theme.dart';
import 'package:gbt_fluent2_ui/src/fluent_models/fluent_stroke_theme.dart';
import 'package:gbt_fluent2_ui/src/fluent_models/fluent_text_theme.dart';



abstract interface class FluentThemeDataModel {
  final FluentTextTheme? fluentTextTheme;
  final FluentStrokeTheme? fluentStrokeTheme;
  final FluentShadowTheme? fluentShadowTheme;



  /// FluentThemeData's constructor
  FluentThemeDataModel( {
    this.fluentTextTheme,
    this.fluentShadowTheme,
    this.fluentStrokeTheme,
  });
}
