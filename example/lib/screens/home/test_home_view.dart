import 'package:example/screens/components_example_view/fluent_avatar_view.dart';
import 'package:example/screens/components_example_view/fluent_button_view.dart';
import 'package:example/screens/components_example_view/fluent_card_view.dart';
import 'package:example/screens/components_example_view/fluent_list_view/fluent_list_example_view.dart';
import 'package:example/screens/design_tokens_view/shadow_view.dart';
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
  final Widget coverImage;

  CardComponentPage({
    required this.description,
    required this.title,
    required this.view,
    required this.coverImage,
  });
}

class DesignTokenItem {
  final String title;
  final Widget view;

  DesignTokenItem({
    required this.title,
    required this.view,
  });
}

class TestHomeView extends StatelessWidget {
  final designTokens = <DesignTokenItem>[
    DesignTokenItem(title: "Shadow", view: ShadowView()),
    DesignTokenItem(title: "Typography", view: TypographyView()),
    DesignTokenItem(title: "Size", view: SizeView()),
  ];
  final cards = <CardComponentPage>[
    CardComponentPage(
      title: "Fluent List",
      description: "Lists organize data in rows",
      view: FluentListView(),
      coverImage: FluentIcon(FluentIcons.content_settings_16_filled),
    ),
    CardComponentPage(
      title: "Fluent Button",
      description: "Lists organize data in rows",
      view: FluentButtonView(),
      coverImage: FluentIcon(FluentIcons.content_settings_16_filled),
    ),
    CardComponentPage(
      title: "Fluent Avatar",
      description:
          "An avatar shows an image or text to represent a person or group as well as gives additional information like their status and activity.",
      view: FluentAvatarView(),
      coverImage: FluentIcon(FluentIcons.person_5_20_filled),
    ),
    CardComponentPage(
      description: "Cards are flexible containers that group related content and actions together. They reveal more information upon interaction.",
      title: "Fluent Card",
      view: FluentCardView(),
      coverImage: FluentIcon(FluentIcons.card_ui_24_filled),
    )
  ];

  TestHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProviderState = ThemeModeProvider.of(context);

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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(
                  FluentSize.size160.value,
                ),
                child: Row(
                  children: [
                    for (CardComponentPage card in cards) ...[
                      Container(
                        height: 192,
                        child: FluentCard(
                          text: card.title,
                          subText: card.description,
                          coverImage: FluentIcon(
                            FluentIcons.list_24_regular,
                            boxSize: 30,
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
                        width: FluentSize.size120.value,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            FluentList.oneLine(
              sectionHeaderTitle: "Design tokens",
              separator: FluentStrokeDivider(),
              listItems: [
                ...designTokens.map(
                  (value) => FluentListItemOneLine(
                    text: value.title,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return value.view;
                        },
                      ));
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
