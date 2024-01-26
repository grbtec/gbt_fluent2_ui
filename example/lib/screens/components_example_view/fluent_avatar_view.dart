import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class PeopleExample {
  final String name;
  final String coverImageUrl;

  PeopleExample({
    required this.name,
    required this.coverImageUrl,
  });
}

class FluentAvatarView extends StatelessWidget {
  FluentAvatarView({super.key});

  final people = [
    PeopleExample(
      name: "Aubrey",
      coverImageUrl:
          "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Kristin",
      coverImageUrl:
          "https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Dustin",
      coverImageUrl:
          "https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Lee",
      coverImageUrl:
          "https://images.pexels.com/photos/2589653/pexels-photo-2589653.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Elara",
      coverImageUrl:
          "https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Júlia",
      coverImageUrl:
          "https://images.pexels.com/photos/1547971/pexels-photo-1547971.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Marcos",
      coverImageUrl:
          "https://images.pexels.com/photos/428361/pexels-photo-428361.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Diego",
      coverImageUrl:
          "https://images.pexels.com/photos/2918513/pexels-photo-2918513.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
    PeopleExample(
      name: "Sara",
      coverImageUrl:
          "https://images.pexels.com/photos/4906334/pexels-photo-4906334.jpeg?auto=compress&cs=tinysrgb&w=800",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Avatar",
          subtitle: "Components > Fluent Avatar",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FluentSectionDescription(
                description: "An avatar shows an image or text to represent "
                    "a person or group as well as gives additional information like their status and activity.",
              ),
              FluentStrokeDivider(
                height: FluentSize.size240.value,
              ),
              FluentSectionHeader(title: "People"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (PeopleExample value in people) ...[
                      Padding(
                        padding: EdgeInsets.all(FluentSize.size120.value),
                        child: Column(
                          children: [
                            FluentAvatar(
                              size: FluentAvatarSize.size56,
                              child: Image.network(
                                value.coverImageUrl,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: FluentSize.size80.value,
                            ),
                            FluentText(
                              value.name,
                              style: FluentThemeDataModel.of(context)
                                  .fluentTextTheme
                                  ?.caption1,
                            )
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              FluentSectionHeader(title: "Behavior"),
              Padding(
                padding: EdgeInsets.only(
                    right: FluentSize.size160.value,
                    left: FluentSize.size160.value,
                    bottom: FluentSize.size160.value),
                child: FluentText(
                  "Avatars can include presence badges to indicate the status of an associated person.",
                ),
              ),
              FluentListItemMultiLine(
                text: "Esther Howard",
                subtext: "You: Let's do this!",
                // available
                leading: FluentAvatar(
                  statusPresenceBadge: StatusPresenceBadge.avaliable,
                  strokeStyle: FluentStrokeStyle(
                    color: Colors.purple,
                    thickness: FluentStrokeThickness.strokeWidth15,
                    padding: FluentSize.size20.value,
                  ),
                  child: Image.network(
                    'https://images.pexels.com/photos/1181686/pexels-photo-1181686.jpeg?auto=compress&cs=tinysrgb&w=800',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  statusPresenceBadge: StatusPresenceBadge.away,
                  size: FluentAvatarSize.size40,
                  child: Image.network(
                    'https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=800',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  size: FluentAvatarSize.size56,
                  cutout: Icon(
                    FluentIcons.heart_12_filled,
                    size: FluentSize.size160.value,
                  ),
                  child: Image.network(
                    'https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=800',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FluentStrokeDivider(
                startIndent: FluentStrokeBorderIndent.strokeIndent56,
                height: 0,
              ),
              FluentListItemMultiLine(
                text: "Cody Fisher",
                subtext: "System all the way down, man!",
                leading: FluentAvatar(
                  size: FluentAvatarSize.size56,
                  statusPresenceBadge: StatusPresenceBadge.dnd,
                  child: Image.network(
                    'https://images.pexels.com/photos/1080213/pexels-photo-1080213.jpeg?auto=compress&cs=tinysrgb&w=800',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
