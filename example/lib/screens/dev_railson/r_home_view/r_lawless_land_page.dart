import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class RLawlessLand extends StatefulWidget {
  const RLawlessLand({super.key});

  @override
  State<RLawlessLand> createState() => _RLawlessLandState();
}

class _RLawlessLandState extends State<RLawlessLand> {
  bool value = false;
  late Timer timer;

  void onChanged(bool value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      final banner = FluentBanner(
        text: 'Banner periodico',
        bannerColor: FluentBannerColor.accent,
      );
      final messenger = FluentScaffoldMessenger.of(context);
      messenger.addBanner(banner);
      await Future.delayed(Duration(seconds: 2));
      messenger.removeBanner(banner);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      // fluentBottomSheet: FluentSheet.bottom(
      //   headerHeight: 40,
      // ),
      bottomNavigationBar: Container(
        color: Colors.green,
        height: 20,
      ),
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.neutral,
        title: NavLeftSubtitle(
          title: "Terra sem lei",
          subtitle: "Railson > Terra sem lei",
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("👉Switch Toggle👈"),
                ),
                FluentSwitchToggle(
                  value: value,
                  onChanged: onChanged,
                ),
                SizedBox(
                  height: 200,
                  child: DraggableScrollableSheet(
                      minChildSize: 0.1,
                      initialChildSize: 0.8,
                      maxChildSize: 1,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          color: Colors.red.withOpacity(0.3),
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(title: Text("Item $index"));
                              }),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FluentCard(
                    text: "My Card",
                    onPressed: () {
                      print("asd");
                    },
                  ),
                ),
                FluentStrokeDivider(
                  style: FluentStrokeStyle(
                    color: Colors.red,
                    thickness: FluentStrokeThickness.strokeWidth20,
                    dashArray: [4, 8, 2, 8],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FluentContainer(
                    strokeStyle: FluentStrokeStyle(
                      thickness: FluentStrokeThickness.strokeWidth20,
                      color: Colors.red,
                      dashArray: [4, 8, 2, 8],
                    ),
                    cornerRadius: FluentCornerRadius.large,
                    padding: EdgeInsets.all(20),
                    child: FluentText("This is a bordered container"),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: FluentSheet.bottom(
              headerHeight: 20,
              headerLeading: Text("Leading"),
              headerTitle: Text("Title"),
              headerTrailing: Text("Trailing"),
              child: Container(
                color: Colors.red,
                child: Text("This is a child"),
              ),
              onMaxExtent: () {
                print("max extent");
              },
              onMinExtent: () {
                print("min extent");
              },
            ),
          )
        ],
      ),
      // bottomSheet: FluentSheet.bottom(
      //   headerHeight: 50,
      // ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
