import 'package:example/routing/routes.dart';
import 'package:example/theme.dart';
import 'package:example/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return FluentProvider(
      child: ThemeModeProvider(
        child: Builder(builder: (context) {
          final themeMode = ThemeModeProvider.of(context).themeMode;

          return MaterialApp(
            title: 'Flutter Demo',
            themeAnimationDuration: Duration.zero,
            debugShowCheckedModeBanner: false,
            routes: Routes.routingTable,
            theme: theme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: home,
          );
        }),
      ),
    );
  }
}
