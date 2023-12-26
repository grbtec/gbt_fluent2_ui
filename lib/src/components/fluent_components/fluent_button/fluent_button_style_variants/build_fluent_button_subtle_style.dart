part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonSubtleStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final FluentButtonSize size = fluentButtonStyle.size;
  final MaterialStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final Color? foregroundPressedColor =
      FluentColors.of(context)?.brandForeground1Pressed;
  final Color? foregroundFocusedColor =
      FluentColors.of(context)?.brandForeground1Rest;
  final Color foregroundDisabledColor = FluentColors.neutralForegroundDisabled1;
  final Color? foregroundRestColor =
      FluentColors.of(context)?.brandForeground1Rest;

  return ButtonStyle(
    backgroundColor:
        backgroundColor ?? MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return RoundedRectangleBorder(
          side: BorderSide(
            color: FluentColors.neutralStrokeFocus2Rest,
            width: FluentStrokeThickness.strokeWidth20.value,
          ),
          borderRadius: BorderRadius.circular(
            size == FluentButtonSize.large
                ? FluentCornerRadius.xLarge.value
                : FluentCornerRadius.large.value,
          ),
        );
      }
      return null;
    }),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            MaterialState.pressed => foregroundPressedColor,
            MaterialState.focused => foregroundFocusedColor,
            MaterialState.disabled => foregroundDisabledColor,
            _ => null,
          };
        }
        return foregroundRestColor;
      },
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  ).merge(_fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle, context: context));
}
