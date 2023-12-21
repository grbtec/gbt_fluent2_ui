import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Icon(Icons.star),
      ),
    );
  }
}
