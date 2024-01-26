import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class ExampleListUser {
  final String name;
  final String text;
  final Widget trailing;
  final String coverImageUrl;
  final String? aditionalText;

  ExampleListUser({
    required this.name,
    required this.text,
    required this.trailing,
    this.aditionalText,
    required this.coverImageUrl,
  });
}

class MultiLineListExampleView extends StatelessWidget {
  MultiLineListExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final exampleListUsers = [
      ExampleListUser(
        name: "Bessie Cooper",
        text: "You: Let's do it",
        coverImageUrl:
            'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=800',
        trailing: FluentText(
          "1m ago",
          style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
        ),
      ),
      ExampleListUser(
          name: "Darrel Steward",
          text: "Sounds good -- thanks!",
          coverImageUrl:
              'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=800',
          trailing: FluentText(
            "3:19 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "Katri Ahokas",
          text: "Sure thing :)",
          coverImageUrl:
              'https://images.pexels.com/photos/3765114/pexels-photo-3765114.jpeg?auto=compress&cs=tinysrgb&w=800',
          trailing: FluentText(
            "2:30 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "Juliet Finch",
          text: "i am available for a sync when you",
          coverImageUrl:
              'https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&w=800',
          trailing: FluentText(
            "2:13 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
          name: "jon Harrington",
          text: "Thanks, i will respond to the request",
          coverImageUrl:
              'https://images.pexels.com/photos/1161668/pexels-photo-1161668.jpeg?auto=compress&cs=tinysrgb&w=800',
          trailing: FluentText(
            "1:59 PM",
            style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
          )),
      ExampleListUser(
        name: "Darrel Steward",
        text: "Amazing! Thanks!",
        trailing: FluentText(
          "4:02 PM",
          style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
        ),
        coverImageUrl:
            "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ),
      ExampleListUser(
        name: "Jane Cooper",
        text: "Product design",
        trailing: FluentIcon(FluentIcons.chevron_right_12_filled),
        aditionalText: "Office",
        coverImageUrl:
            "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=800",
      )
    ];

    return FluentContainer(
      padding: EdgeInsets.only(top: FluentSize.size120.value),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FluentText(
              "Multi-line",
              style: FluentThemeDataModel.of(context).fluentTextTheme?.title2,
            ),
            FluentText(
              "Lists organize data in rows.",
              style: FluentThemeDataModel.of(context).fluentTextTheme?.caption1,
            ),
            FluentList.multiLine(
              sectionHeaderTitle: "Messages",
              listItems: [
                ...exampleListUsers.map(
                  (user) => FluentListItemMultiLine(
                    text: user.name,
                    subtext: user.text,
                    trailing: user.trailing,
                    leading: FluentAvatar(
                      child: Image.network(
                        user.coverImageUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FluentList.multiLine(
              sectionHeaderTitle: "Recent Files",
              listItems: [
                FluentListItemMultiLine(
                  text: "S&A Brainstorm",
                  subtext: "Audrey Webb sent • 2 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                        fluentColor: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground3Rest
                        ),
                      )),
                ),
                FluentListItemMultiLine(
                  text: "FY25 Sales Projection",
                  subtext: "Kristine Mitchell sent • 3 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                        fluentColor: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground3Rest
                        ),
                      )),
                ),
                FluentListItemMultiLine(
                  text: "Edge Brand growth MSAI ",
                  subtext: "Aubrey Edwards sent • 3 days ago",
                  leading: FluentIcon(FluentIcons.square_12_filled),
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                        fluentColor: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground3Rest
                        ),
                      )),
                ),
                FluentListItemMultiLine(
                  text: "Design hiring matrix",
                  subtext: "Dustin Steward sent • 4 days ago",
                  additionalContent: FluentText("some more text",
                      style: FluentThemeDataModel.of(context)
                          .fluentTextTheme
                          ?.caption1
                          ?.fluentCopyWith(
                            fluentColor: colorMode(
                              FluentColors.neutralForeground2Rest,
                              FluentDarkColors.neutralForeground3Rest
                            ),
                          )),
                  leading: FluentIcon(FluentIcons.square_12_filled),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
