import 'package:example/screens/dev_brunno/me_control/fluent_me_control.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  final Color? backgroundColor;

  const ProgressView({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Stack(
          children: [FluentMeControl(), Container()],
        ),
      ),
    );
  }
}
