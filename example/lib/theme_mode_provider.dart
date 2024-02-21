import 'package:flutter/material.dart';

class ThemeModeProvider extends StatefulWidget {
  final Widget child;

  const ThemeModeProvider({super.key, required this.child});

  @override
  State<ThemeModeProvider> createState() => _ThemeModeProviderState();

  static _ThemeModeProviderState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedThemeModeProvider>()!
        .state;
  }
}

class _ThemeModeProviderState extends State<ThemeModeProvider> {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void set themeMode(ThemeMode value) {
    _themeMode = value;

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedThemeModeProvider(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedThemeModeProvider extends InheritedWidget {
  final _ThemeModeProviderState state;

  _InheritedThemeModeProvider({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
