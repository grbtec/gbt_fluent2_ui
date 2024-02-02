import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentCard extends StatelessWidget {
  final Widget? coverImage;
  final String text;
  final String? subText;
  @Deprecated("Use 'leading' instead. Since v4.x")
  final Uri? iconImage;
  final double? leadingBoxSize;
  final Widget? leading;
  final VoidCallback? onPressed;
  final Color? highlightColor;

  /// FluentCard's constructor
  const FluentCard({
    super.key,
    required this.text,
    this.subText,
    this.coverImage,
    this.onPressed,
    this.highlightColor,
    this.leading,
    this.leadingBoxSize = 24,
    @Deprecated("Use 'leading' instead. Since v4.x") this.iconImage,
  }) : assert(
            leading != null && iconImage == null ||
                leading == null && iconImage != null ||
                leading == null && iconImage == null,
            "You can't pass both leading and iconImage");

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
    final leading = this.leading;
    final subText = this.subText;
    final colorMode = createColorMode(Theme.of(context).brightness);

    return conditionalButton(
      child: FluentCardContainer(
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
                  // if (iconImage != null) ...[
                  //   Image.network(
                  //     iconImage.toString(),
                  //     height: 24,
                  //     width: 24,
                  //     fit: BoxFit.cover,
                  //   ),
                  //   const SizedBox(
                  //     width: 12,
                  //   ),
                  // ],
                  if (iconImage != null) ...[
                    Image.network(
                      iconImage.toString(),
                      height: leadingBoxSize,
                      width: leadingBoxSize,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                  ] else if (leading != null)
                    if (leading is Icon) ...[
                      IconTheme(
                        data: IconThemeData(
                            color: colorMode(
                          FluentColors.neutralForeground3Rest,
                          FluentDarkColors.neutralForeground3Rest,
                        )),
                        child: leading,
                      ),
                      const SizedBox(width: 12),
                    ] else ...[
                      FluentContainer(
                        width: leadingBoxSize,
                        height: leadingBoxSize,
                        child: leading,
                      ),
                      const SizedBox(width: 12),
                    ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FluentText(
                          text,
                          style: FluentThemeDataModel.of(context)
                              .fluentTextTheme
                              ?.body2,
                        ),
                        if (subText != null)
                          FluentText(
                            subText,
                            textOverflow: TextOverflow.ellipsis,
                            style: FluentThemeDataModel.of(context)
                                .fluentTextTheme
                                ?.caption1,
                          ),
                      ],
                    ),
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
