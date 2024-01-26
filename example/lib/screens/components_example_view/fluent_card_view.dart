import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentCardView extends StatelessWidget {
  const FluentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Card",
          subtitle: "Components > Fluent Card",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(
          width: double.maxFinite,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FluentCard(
                  text: "Card 1 example",
                  subText: "This is a description text",
                  coverImage: Image.network(
                    "https://images.pexels.com/photos/87812/pexels-photo-87812.jpeg?auto=compress&cs=tinysrgb&w=800",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentCard(
                  text: "Card 2 example",
                  subText: "This is a description text",
                  coverImage: Image.network(
                    "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=800",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: FluentSize.size160.value,
                ),
                FluentCard(
                  text: "Card 3 example",
                  subText: "This is a description text",
                  iconImage: Uri.parse(
                      "https://images.pexels.com/photos/4050347/pexels-photo-4050347.jpeg?auto=compress&cs=tinysrgb&w=800"),
                  coverImage: Image.network(
                    "https://images.pexels.com/photos/57690/pexels-photo-57690.jpeg?auto=compress&cs=tinysrgb&w=800",
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
