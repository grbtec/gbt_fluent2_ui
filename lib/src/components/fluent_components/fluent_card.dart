import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentCard extends StatelessWidget {
  final Widget? coverImage;
  final String text;
  final String? subText;
  final Uri? iconImage;
  final VoidCallback? onPressed;
  final Color? highlightColor;

  /// FluentCard's constructor
  const FluentCard({
    required this.text,
    this.subText,
    super.key,
    this.coverImage,
    this.iconImage,
    this.onPressed,
    this.highlightColor,
  });

  Widget conditionalButton({required Widget child}) {
    if (onPressed == null) {
      return child;
    }
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        ClipRRect(
          borderRadius: BorderRadius.circular(FluentCornerRadius.large.value),
          child: RawMaterialButton(
            highlightColor: highlightColor,
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            onPressed: onPressed,
            child: Opacity(
              opacity: 0,
              child: child,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final coverImage = this.coverImage;

    final subText = this.subText;
    final shortenedString = subText != null
        ? subText.length > 20
            ? subText.replaceAll(subText.substring(20), '...')
            : subText
        : null;

    return conditionalButton(
      child:  FluentCardContainer(
          width: 280,
          constraints: BoxConstraints(maxHeight: 192),
          child: Column(
            children: [
              if (coverImage != null)
              Expanded(
                child: coverImage,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    if (iconImage != null) ...[
                      Image.network(
                        iconImage.toString(),
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentText(
                          text,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.body2,
                        ),
                        if (shortenedString != null)
                          FluentText(
                            shortenedString,
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
