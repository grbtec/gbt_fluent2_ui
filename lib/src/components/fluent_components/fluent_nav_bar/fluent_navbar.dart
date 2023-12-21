import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_theme.dart';


class FluentNavBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final NavTitleVariation? title;
  final Widget? leading;
  final Color? foregroundColor;
  final Widget? child;
  final FluentThemeColorVariation themeColorVariation;
  final Color? backgroundColor;
  final Gradient? gradient;

  /// FluentNavBar's constructor
  const FluentNavBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.foregroundColor,
    this.child,
    this.themeColorVariation = FluentThemeColorVariation.neutral,
    this.backgroundColor,
    this.gradient,
  });

  @override
  Size get preferredSize => Size.fromHeight(child != null ? 96 : 48);

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    final bool isTitleCentered =
        title is NavCenterTitle || title is NavCenterSubtitle;

    final child = this.child;

    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            title?.avatar ?? const SizedBox(),
            if (title?.avatar != null) const SizedBox(width: 8),
            Column(
              crossAxisAlignment: isTitleCentered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                FluentText(
                  title?.title ?? '',
                  style: title is NavLeftTitle
                      ? GbtFluentThemeData.of(context).fluentTextTheme?.title1?.fluentCopyWith(
                          fluentColor:
                              themeColorVariation == FluentThemeColorVariation.brand
                                  ? FluentColors.controlsNavBarForeground1Rest
                                  : FluentColors.neutralForeground1Rest,
                        )
                      : GbtFluentThemeData.of(context).fluentTextTheme?.body1Strong
                          ?.fluentCopyWith(
                          fluentColor:
                              themeColorVariation == FluentThemeColorVariation.brand
                                  ? FluentColors.controlsNavBarForeground1Rest
                                  : FluentColors.neutralForeground1Rest,
                        ),
                ),
                if (title?.subtitle != null)
                  FluentText(
                    title?.subtitle ?? '',
                    style: GbtFluentThemeData.of(context).fluentTextTheme?.caption2
                        ?.fluentCopyWith(
                      fluentColor: themeColorVariation == FluentThemeColorVariation.brand
                          ? FluentColors.controlsNavBarForeground2Rest
                          : FluentColors.neutralForeground2Rest,
                    ),
                  ),
              ],
            ),
          ],
        ),
        titleSpacing: 16,
        leading: leading,
        centerTitle: isTitleCentered,
        actions: actions
            ?.map(
              (action) => Padding(
                padding: title is NavLeftTitle
                    ? const EdgeInsets.only(right: 20)
                    : const EdgeInsets.only(right: 16),
                child: action,
              ),
            )
            .toList(),
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
        ),
        backgroundColor: backgroundColor ??
            (themeColorVariation == FluentThemeColorVariation.brand
                ? Theme.of(context).primaryColor
                : FluentColors.neutralBackground3Rest),
        foregroundColor: themeColorVariation == FluentThemeColorVariation.brand
            ? Colors.white
            : FluentColors.neutralForeground2Rest,
        bottom: child != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: child,
                ),
              )
            : null,
      ),
    );
  }
}
