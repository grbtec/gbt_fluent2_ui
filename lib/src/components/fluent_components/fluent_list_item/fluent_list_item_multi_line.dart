import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentListItemMultiLine extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String? text;
  final String? subtext;
  final Widget? additionalContent;
  final Color? tileColor;
  final void Function()? onTap;

  /// FluentList's constructor
  const FluentListItemMultiLine({
    super.key,
    this.leading,
    this.trailing,
    this.tileColor,
    this.text,
    this.onTap,
    this.subtext,
    this.additionalContent,
  });

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final text = this.text;
    final subtext = this.subtext;
    final additionalContent = this.additionalContent;

    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      contentPadding: EdgeInsets.symmetric(
        horizontal: FluentSize.size160.value,
      ),
      minVerticalPadding: FluentSize.size120.value,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            FluentContainer(
              width: FluentSize.size400.value,
              height: FluentSize.size400.value,
              child: leading,
            ),
            SizedBox(
              width: FluentSize.size160.value,
            ),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (text != null)
                  FluentText(
                    text,
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.body1
                        ?.fluentCopyWith(
                          fluentColor: colorMode(
                            FluentColors.neutralForeground1Rest,
                            FluentDarkColors.neutralForeground1Rest,
                          ),
                        ),
                  ),
                if (subtext != null)
                  Padding(
                    padding: EdgeInsets.only(right: FluentSize.size40.value),
                    child: FluentText(
                      subtext,
                      textOverflow: TextOverflow.ellipsis,
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                              FluentColors.neutralForeground2Rest,
                              FluentDarkColors.neutralForeground2Rest,
                            ),
                          ),
                    ),
                  ),
                if (additionalContent != null) additionalContent
              ],
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
    );
  }
}
