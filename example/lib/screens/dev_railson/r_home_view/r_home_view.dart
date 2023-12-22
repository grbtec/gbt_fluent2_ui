
import 'package:example/screens/dev_railson/r_home_view/r_activity_indicator_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_home_controller.dart';
import 'package:example/screens/dev_railson/r_home_view/r_inputs_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_lawless_land_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_progress_bar_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_progress_indicator_page.dart';
import 'package:example/screens/dev_railson/r_home_view/r_toast_and_banner_page.dart';
import 'package:flutter/material.dart';
import 'package:gbt_essentials/gbt_essentials.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class RHomeView extends StatefulWidget {
  const RHomeView({super.key});

  @override
  State<RHomeView> createState() => _RHomeViewState();
}

class _RHomeViewState extends State<RHomeView> with TickerProviderStateMixin {
  late final RHomeController controller;

  @override
  void initState() {
    super.initState();
    controller = RHomeController(vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    debug(Theme.of(context).colorScheme.primary);

    RefreshIndicator(
      onRefresh: () async {},
      child: Placeholder(),
    );
    return FluentScaffold(
      // bottomSheet: Text("UMA MESSAGEM LEGAL EMBAIXO. TIPO PROMOCA, CLICK AQUI"),

      body: AnimatedBuilder(
        animation: controller.tabController,
        builder: (BuildContext context, Widget? child) {
          switch (controller.tabController.index) {
            case 0:
              return RToastAndBannerPage();
            case 1:
              return RProgressIndicatorPage();
            case 2:
              return RActivityIndicatorPage();
            case 3:
              return RProgressBarPage();
            case 4:
              return RLawlessLand();
            case 5:
              return RInputsPage();
          }
          return Placeholder();
        },
      ),
      // bottomSheet: SafeArea(
      //   child: FluentBanner(
      //     bannerColor: color,
      //     text: '${color}: Closing soon',
      //   ),
      // ),
      bottomNavigationBar: FluentTabBar.bottomLabel(
        controller: controller.fluentTabBarController,
        onChanged: (value) {
          debug("Mudou para a tab $value");
        },
        items: [
          FluentTabBarItemBottomLabel(
            label: 'Toast & Banner',
            icon: Icon(Icons.one_k),
            showBadge: false,
          ),
          FluentTabBarItemBottomLabel(
            label: "ProgressIndicator",
            icon: Icon(Icons.two_k),
          ),
          FluentTabBarItemBottomLabel(
            label: "HUD",
            icon: Icon(Icons.three_k),
            showBadge: true,
            tooltip: "I have tooltip",
          ),
          FluentTabBarItemBottomLabel(
            label: "ProgressBar",
            icon: Icon(Icons.four_k),
          ),
          FluentTabBarItemBottomLabel(
            label: "Terra sem lei",
            icon: Icon(Icons.five_k),
          ),
          FluentTabBarItemBottomLabel(
            label: "Inputs",
            icon: Icon(Icons.six_k),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
