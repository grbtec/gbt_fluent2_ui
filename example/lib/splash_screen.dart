import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/gbt_fluent2_ui.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
