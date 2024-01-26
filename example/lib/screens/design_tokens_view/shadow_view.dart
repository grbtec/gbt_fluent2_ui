import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class ShadowExampleItem {
  final String name;
  final FluentShadow? shadow;

  ShadowExampleItem({required this.name, required this.shadow});
}

class ShadowView extends StatelessWidget {
  const ShadowView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final shadows = [
      ShadowExampleItem(
        name: "Shadow 2",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow2,
      ),
      ShadowExampleItem(
        name: "Shadow 4",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow4,
      ),
      ShadowExampleItem(
        name: "Shadow 8",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow8,
      ),
      ShadowExampleItem(
        name: "Shadow 16",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow16,
      ),
      ShadowExampleItem(
        name: "Shadow 28",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow28,
      ),
      ShadowExampleItem(
        name: "Shadow 64",
        shadow: FluentThemeDataModel.of(context).fluentShadowTheme?.shadow64,
      ),
    ];

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Shadows",
          subtitle: "Design Tokens > Typography",
        ),
      ),
      body: SafeArea(
        child: FluentContainer(
          color: colorMode(FluentColors.neutralBackgroundCanvasRest,
              FluentDarkColors.neutralBackgroundCanvasRest),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FluentSectionDescription(
                  description:
                      "Elevation is the perceived distance between an object and"
                      " the surface behind it using shadows and light. Elevate UI "
                      "elements to create visual cues, aid scannability, and convey levels of importance.",
                ),
                FluentStrokeDivider(height: FluentSize.size240.value),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: FluentSize.size80.value),
                  child: FluentText(
                    "Low elevation ramp",
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.title2,
                  ),
                ),
                for (ShadowExampleItem shadow in shadows) ...[
                  FluentSectionHeader(
                      title: shadow.name,
                      titleVariant: SectionHeaderTitleVariant.subtle),
                  FluentCardContainer(
                    width: 70,
                    height: 70,
                    shadow: shadow.shadow,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
