part of '../fluent_button.dart';

ButtonStyle _buildFluentButtonAccentStyle(
  FluentButtonStyle fluentButtonStyle,
  BuildContext context,
) {
  final colorMode = createColorMode(Theme.of(context).brightness);
  final MaterialStateProperty<Color?>? backgroundColor =
      fluentButtonStyle.backgroundColor;

  return ButtonStyle(
    backgroundColor: backgroundColor ??
        MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.length == 1) {
              return switch (states.single) {
                MaterialState.pressed =>
                  FluentColors.of(context)?.brandBackground1Pressed,
                MaterialState.focused =>
                  FluentColors.of(context)?.brandBackground1Selected,
                MaterialState.disabled => colorMode(
                    FluentColors.neutralBackground5Rest,
                    FluentDarkColors.neutralBackground5Rest,
                  ),
                _ => null,
              };
            }
            return FluentColors.of(context)?.brandBackground1Rest;
          },
        ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return colorMode(
            FluentColors.neutralForegroundDisabled1Rest,
            FluentDarkColors.neutralForegroundDisabled1Rest,
          );
        }
        return colorMode(
          FluentColors.neutralForeground1Rest,
          FluentDarkColors.neutralBackground1Rest,
        );
      },
    ),
  ).merge(
    _fluentButtonDefaultStyle(
      fluentButtonStyle: fluentButtonStyle,
      context: context,
    ),
  );
}
