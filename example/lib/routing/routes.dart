import 'package:example/screens/home/home_view.dart';
import 'package:flutter/cupertino.dart';

/// Routes
abstract final interface

class Routes {
  static const home = "/home";
  static const delivery = "/delivery";
  static const about = "/about";

  static Map<String, WidgetBuilder> get routingTable =>
      {
        Routes.home: (_) {
          return HomeView();
        },
        Routes.delivery: (_) {
          return Container();
        }
      };
}
