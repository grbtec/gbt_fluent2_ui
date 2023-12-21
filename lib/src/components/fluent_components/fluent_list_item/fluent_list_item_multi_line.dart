import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_theme.dart';

class FluentListItemMultiLine extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String? text;
  final String? subtext;
  final Widget? additionalContent;

  /// FluentList's constructor
  const FluentListItemMultiLine({
    super.key,
    this.leading,
    this.trailing,
    this.text,
    this.subtext,
    this.additionalContent,
  });

  @override
  Widget build(BuildContext context) {
    final text = this.text;
    final subtext = this.subtext;
    final additionalContent = this.additionalContent;

    return Column(
      children: [
        ListTile(
          tileColor: FluentColors.neutralBackground3Rest,
          contentPadding: EdgeInsets.symmetric(
            horizontal: FluentSize.size160.value,
            vertical: FluentSize.size120.value,
          ),
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
                        style: GbtFluentThemeData.of(context)
                            .fluentTextTheme
                            ?.body1
                            ?.fluentCopyWith(
                              fluentColor: FluentColors.neutralForeground1Rest,
                            ),
                      ),
                    if (subtext != null)
                      FluentText(
                        subtext,
                        style: GbtFluentThemeData.of(context)
                            .fluentTextTheme
                            ?.caption1
                            ?.fluentCopyWith(
                              fluentColor: FluentColors.neutralForeground2Rest,
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
        ),
      ],
    );
  }
}
