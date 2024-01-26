import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class ShadowView extends StatelessWidget {
  const ShadowView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Shadows",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(),
      ),
    );
  }
}
