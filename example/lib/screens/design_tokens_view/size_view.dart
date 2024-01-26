import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class SizeView extends StatelessWidget {
  const SizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Sizes",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(),
      ),
    );
  }
}
