import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentInitials extends StatelessWidget {
  final String name;

  /// The color with opacity for the background.
  final Color? backgroundColor;

  /// The color that will be used in initials.
  final Color? foregroundColor;

  /// The Size of container, if not passed, the size will be double.maxFinite.
  final Size? size;

  /// The fontSize of the initials.
  final double? fontSize;

  /// The fontWeight of the initials.
  ///
  /// Can be passed the InitialsFontWeight.regular and InitialsFontWeight.medium values.
  final InitialsFontWeight? fontWeight;

  /// Show the initials of a person's name. This component must be used within FluentAvatar.
  const FluentInitials({
    super.key,
    required this.name,
    this.foregroundColor,
    this.backgroundColor,
    this.size,
    this.fontSize,
    this.fontWeight = InitialsFontWeight.regular,
  });

  String _getInitials(String name) {
    final List<String> nameParts = name.split(' ');
    String initials = '';

    for (var i = 0; i < nameParts.length && i < 3; i++) {
      final part = nameParts[i];

      if (part.length > 0) {
        final firstLetter = part[0].toUpperCase();

        initials += firstLetter;

        print('is not empty => ${part.runtimeType}');
        print('And this is the first letter => $firstLetter');
      } else {
        print('is empty => ${part.runtimeType}');
      }
    }

    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return FluentContainer(
      cornerRadius: FluentCornerRadius.circle,
      color: backgroundColor ??
          GbtFluentThemeData.of(context).colorScheme.primary.withOpacity(0.3),
      width: size?.width ?? double.maxFinite,
      height: size?.height ?? double.maxFinite,
      alignment: Alignment.center,
      child: FluentText(
        _getInitials(name),
        style: GbtFluentThemeData.of(context)
            .fluentTextTheme
            ?.caption2
            ?.fluentCopyWith(
              fluentColor: foregroundColor ??
                  GbtFluentThemeData.of(context).colorScheme.primary,
              fluentSize: fontSize,
              fluentWeight: fontWeight == InitialsFontWeight.medium
                  ? MixedFluentFontWeight.semibold
                  : MixedFluentFontWeight.regular,
            ),
      ),
    );
  }
}

enum InitialsFontWeight { regular, medium }
