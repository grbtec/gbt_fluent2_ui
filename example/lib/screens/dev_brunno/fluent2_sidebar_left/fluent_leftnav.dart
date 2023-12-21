import 'package:flutter/material.dart';

class FluentLeftNav extends StatelessWidget {
  final Color? backgroundColor;
  final List<Widget> children;

  const FluentLeftNav(
      {super.key, this.backgroundColor, required this.children});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: backgroundColor ?? Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              // lista de componentes para ser passados abaixo (children : [])
              children: children,
            ),
          ),
        ));
  }
}
