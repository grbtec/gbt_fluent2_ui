import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentPopoverView extends StatefulWidget {
  const FluentPopoverView({super.key});

  @override
  State<FluentPopoverView> createState() => _FluentPopoverViewState();
}

class _FluentPopoverViewState extends State<FluentPopoverView> {
  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Popover",
          subtitle: "Components > Fluent Popover",
        ),
      ),
      body: Column(
        children: [
          FluentSectionDescription(
            description:
            "Open a popover from a menu button.",
          ),
          FluentStrokeDivider(height: FluentSize.size480.value),
          FluentSectionHeader(
            title: "Card with popover ",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Bottom Sheet",
              onPressed: () async {
                showFluentBottomSheet(
                  context: context,
                  headerTitle: Text("BottomSheet"),
                  headerLeading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FluentIcons.arrow_left_24_regular),
                  ),
                  child: Text("This is the body of the BottomSheet"),
                );
              },
            ),
          ),
          FluentSectionHeader(
            title: "Half",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Bottom Sheet",
              onPressed: () async {
                showFluentBottomSheet(
                  context: context,
                  half: true,
                  headerTitle: Text("BottomSheet (Half)"),
                  headerLeading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FluentIcons.arrow_left_24_regular),
                  ),
                  child: Text("This is the body of the BottomSheet"),
                );
              },
            ),
          ),
          FluentSectionDescription(
            description: "Example of sheets with header and body.",
          )
        ],
      ),
    );
  }
}
