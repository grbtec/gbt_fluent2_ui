import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentListItemOneLine extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String text;
  final void Function()? onTap;
  final Color? textColor;

  /// FluentList's constructor
  const FluentListItemOneLine({
    required this.text,
    super.key,
    this.onTap,
    this.leading,
    this.trailing,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final text = this.text;
    final leading = this.leading;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: FluentSize.size120.value,
          horizontal: FluentSize.size160.value,
        ),
        child: Row(
          children: [
            if (leading != null) ...[
              FluentContainer(
                width: FluentSize.size240.value,
                height: FluentSize.size240.value,
                child: leading is Icon
                    ? IconTheme(
                        data: IconThemeData(
                          color: colorMode(
                            FluentColors.neutralForeground3Rest,
                            FluentDarkColors.neutralForeground3Rest,
                          ),
                        ),
                        child: leading,
                      )
                    : leading,
              ),
              SizedBox(
                width: FluentSize.size160.value,
              ),
            ],
            Expanded(
              child: FluentContainer(
                child: FluentText(
                  text,
                  style: FluentThemeDataModel.of(context)
                      .fluentTextTheme
                      ?.body1
                      ?.fluentCopyWith(
                        fluentColor: textColor ??
                            colorMode(
                              FluentColors.neutralForeground1Rest,
                              FluentDarkColors.neutralForeground1Rest,
                            ),
                      ),
                ),
              ),
            ),
            if (trailing != null) ...[
              SizedBox(
                width: FluentSize.size80.value,
              ),
              FluentContainer(child: trailing),
            ],
          ],
        ),
      ),
    );
  }
}
