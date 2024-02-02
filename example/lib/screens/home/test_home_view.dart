import 'package:example/screens/components_example_view/fluent_avatar_view.dart';
import 'package:example/screens/components_example_view/fluent_banner_view.dart';
import 'package:example/screens/components_example_view/fluent_button_view.dart';
import 'package:example/screens/components_example_view/fluent_card_view.dart';
import 'package:example/screens/components_example_view/fluent_list_view/fluent_list_example_view.dart';
import 'package:example/screens/components_example_view/fluent_toast_view.dart';
import 'package:example/screens/design_tokens_view/shadow_view.dart';
import 'package:example/screens/design_tokens_view/shapes_view.dart';
import 'package:example/screens/design_tokens_view/size_view.dart';
import 'package:example/screens/design_tokens_view/typography_view.dart';
import 'package:example/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class CardComponentPage {
  final String description;
  final String title;
  final Widget view;
  final IconData previewIcon;

  CardComponentPage({
    required this.description,
    required this.title,
    required this.view,
    required this.previewIcon,
  });
}

class DesignTokenItem {
  final String title;
  final Widget view;
  final IconData leadingIcon;

  DesignTokenItem({
    required this.title,
    required this.view,
    required this.leadingIcon,
  });
}

class TestHomeView extends StatelessWidget {
  final cards = <CardComponentPage>[
    CardComponentPage(
      title: "Fluent List",
      description: "Lists organize data in rows",
      view: FluentListView(),
      previewIcon: FluentIcons.list_20_regular,
    ),
    CardComponentPage(
      title: "Fluent Button",
      description: "Lists organize data in rows",
      view: FluentButtonView(),
      previewIcon: FluentIcons.button_20_regular,
    ),
    CardComponentPage(
      title: "Fluent Avatar",
      description:
          "An avatar shows an image or text to represent a person or group as well as gives additional information like their status and activity.",
      view: FluentAvatarView(),
      previewIcon: FluentIcons.person_circle_20_regular,
    ),
    CardComponentPage(
      description:
          "Cards are flexible containers that group related content and actions together. They reveal more information upon interaction.",
      title: "Fluent Card",
      view: FluentCardView(),
      previewIcon: FluentIcons.card_ui_24_regular,
    ),
    CardComponentPage(
      description: "Show only for peristent notifications until completion",
      title: "Fluent Banner",
      view: FluentBannerView(),
      previewIcon: FluentIcons.rectangle_landscape_12_filled,
    ),
    CardComponentPage(
      description:
          "Toast notifications can be dismissed automatically or after the user performs the action/cancel.",
      title: "Fluent Toast",
      view: FluentToastView(),
      previewIcon: FluentIcons.square_shadow_12_regular,
    )
  ];

  final designTokens = <DesignTokenItem>[
    DesignTokenItem(
      title: "Shadow",
      view: ShadowView(),
      leadingIcon: FluentIcons.square_shadow_12_regular,
    ),
    DesignTokenItem(
      title: "Size",
      view: SizeView(),
      leadingIcon: FluentIcons.slide_size_20_regular,
    ),
    DesignTokenItem(
      title: "Typography",
      view: TypographyView(),
      leadingIcon: FluentIcons.text_12_regular,
    ),
    DesignTokenItem(
      title: "Shapes",
      view: ShapesView(),
      leadingIcon: FluentIcons.shapes_16_regular,
    )
  ];

  TestHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProviderState = ThemeModeProvider.of(context);
    final colorMode = createColorMode(Theme.of(context).brightness);

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent 2 UI",
          subtitle: "Developed by Grbtec",
        ),
        themeColorVariation: FluentThemeColorVariation.brand,
        actions: [
          FluentSwitchToggle(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                if (themeModeProviderState.themeMode == ThemeMode.dark) {
                  themeModeProviderState.themeMode = ThemeMode.light;
                } else {
                  themeModeProviderState.themeMode = ThemeMode.dark;
                }
              })
        ],
        child: FluentSearchBar.leftAligned(
          themeColorVariation: FluentThemeColorVariation.brand,
          hintText: "Search",
          onSearch: (value) async {
            await Future.delayed(
              Duration(seconds: 2),
            );
          },
          onCancelOperation: () {},
        ),
      ),
      drawer: FluentLeftNav(
        headerAvatar: FluentAvatar(
          size: FluentAvatarSize.size36,
          strokeStyle: colorMode(
            null,
            FluentStrokeStyle(
              thickness: FluentStrokeThickness.strokeWidth20,
              color: FluentDarkColors.neutralBackground1Rest,
            ),
          ),
          child: FluentInitials(
            name: "Krystal McKinney",
          ),
        ),
        header: FluentListItemMultiLine(
          text: "Krystal McKinney",
          subtext: "l.mckinney@schoolofineart.com",
          leading: FluentAvatar(
            size: FluentAvatarSize.size40,
            child: FluentIcon.outlinedPrimaryIcon(
              FluentIcons.person_12_filled,
            ),
          ),
        ),
        body: Column(
          children: [
            ...designTokens.map(
              (value) => FluentListItemOneLine(
                leading: Icon(value.leadingIcon),
                text: value.title,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return value.view;
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: FluentContainer(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: FluentSize.size240.value),
              child: Column(
                children: [
                  for (CardComponentPage card in cards) ...[
                    Container(
                      height: 192,
                      child: FluentCard(
                        leading: Icon(FluentIcons.puzzle_cube_piece_20_filled),
                        text: card.title,
                        subText: card.description,
                        coverImage: FluentIcon.outlinedPrimaryIcon(
                          card.previewIcon,
                          cornerRadius: FluentCornerRadius.none,
                          iconSize: FluentSize.size560.value,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => card.view,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: FluentSize.size120.value,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
