part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonOutlineAccentStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final FluentButtonSize size = fluentButtonStyle.size;
  final MaterialStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;
  final strokeRestColor = FluentColors.of(context)?.brandStroke1Rest;
  final strokePressedColor = FluentColors.of(context)?.brandStroke1Pressed;
  final strokeFocusedColor = colorMode(
    FluentColors.neutralStrokeFocus2Rest,
    FluentDarkColors.neutralStrokeFocus2Rest,
  );
  final strokeDisabledColor = colorMode(
    FluentColors.neutralStrokeDisabledRest,
    FluentDarkColors.neutralStrokeDisabledRest,
  );

  return ButtonStyle(
    backgroundColor:
        backgroundColor ?? MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            MaterialState.pressed => strokePressedColor != null
                ? RoundedRectangleBorder(
                    side: BorderSide(
                      color: strokePressedColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      size == FluentButtonSize.large
                          ? FluentCornerRadius.xLarge.value
                          : FluentCornerRadius.large.value,
                    ),
                  )
                : null,
            MaterialState.focused => RoundedRectangleBorder(
                side: BorderSide(
                    color: strokeFocusedColor,
                    width: FluentStrokeThickness.strokeWidth20.value),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              ),
            MaterialState.disabled => RoundedRectangleBorder(
                side: BorderSide(
                  color: strokeDisabledColor,
                ),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              ),
            _ => null,
          };
        }
        return strokeRestColor != null
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: strokeRestColor,
                ),
                borderRadius: BorderRadius.circular(
                  size == FluentButtonSize.large
                      ? FluentCornerRadius.xLarge.value
                      : FluentCornerRadius.large.value,
                ),
              )
            : null;
      },
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.length == 1) {
          return switch (states.single) {
            MaterialState.pressed =>
              FluentColors.of(context)?.brandForeground1Pressed,
            MaterialState.focused =>
              FluentColors.of(context)?.brandForeground1Rest,
            MaterialState.disabled => colorMode(
                FluentColors.neutralForegroundDisabled1Rest,
                FluentDarkColors.neutralForegroundDisabled1Rest,
              ),
            _ => null,
          };
        }
        if (states.contains(MaterialState.disabled)) {
          return colorMode(
            FluentColors.neutralForegroundDisabled1Rest,
            FluentDarkColors.neutralForegroundDisabled1Rest,
          );
        }
        return FluentColors.of(context)?.brandForeground1Rest;
      },
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  ).merge(_fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle, context: context));
}
