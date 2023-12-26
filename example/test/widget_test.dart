// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/my_app.dart';
import 'package:example/routing/routes.dart';
import 'package:example/screens/dev_leticya/l_home_view/l_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Pump MyApp with Routes.home', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      home: buildByRoute(Routes.home),
    ));
  });

  testWidgets('Pump RHomeView', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp(
    //   home: RHomeView(),
    // ));
  });

  testWidgets('Pump LHomeView', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      home: LHomeView(),
    ));
  });

}

Widget buildByRoute(String route) {
  return Builder(
    builder: (context) {
      return Routes.routingTable[Routes.home]!(context);
    },
  );
}
