import 'package:example/routing/routes.dart';
import 'package:example/theme.dart';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return FluentProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: Routes.routingTable,
        theme: theme,
        home: home,
      ),
    );
  }
}
