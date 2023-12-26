import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

part 'fluent_banner_color.dart';

class FluentBanner extends StatelessWidget {
  final FluentBannerColor bannerColor;
  final String text;

  const FluentBanner({
    super.key,
    required this.bannerColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = switch(bannerColor){
      FluentBannerColor.accent => Theme.of(context).primaryColor,
      FluentBannerColor.subtle => Theme.of(context).primaryColor,
      FluentBannerColor.neutral => FluentColors.neutralForeground2Rest,
    };
    final backgroundColor = switch(bannerColor){
      FluentBannerColor.accent => ColorTween(
        begin: Theme.of(context).primaryColor,
        end: Colors.white,
      ).lerp(0.7),
      FluentBannerColor.subtle => FluentColors.neutralBackground1Rest,
      FluentBannerColor.neutral => FluentColors.neutralBackground5Rest,
    };

    var buildBorder = ({required Widget child})=>child;

    if(bannerColor == FluentBannerColor.subtle){
      buildBorder = ({required Widget child}){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FluentStrokeDivider(),
            child
          ],
        );
      };
    }

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: buildBorder(
          child: SizedBox(
            width: double.maxFinite,
            height: 52,
            child: Center(
              child: FluentText(
                text,
                style: FluentThemeDataModel.of(context)
                    .fluentTextTheme
                    ?.body2
                    ?.fluentCopyWith(
                  fluentColor: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
