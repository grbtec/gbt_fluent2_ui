import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class CornerRadiusVariant {
  final String variant;
  final double boxSize;
  final FluentCornerRadius cornerRadius;

  CornerRadiusVariant({
    required this.variant,
    required this.boxSize,
    required this.cornerRadius,
  });
}

class ShapesView extends StatelessWidget {
  ShapesView({super.key});

  final cornerRadiusVariants = [
    CornerRadiusVariant(
      variant: "2",
      cornerRadius: FluentCornerRadius.small,
      boxSize: FluentSize.size280.value,
    ),
    CornerRadiusVariant(
      variant: "4",
      cornerRadius: FluentCornerRadius.medium,
      boxSize: FluentSize.size560.value,
    ),
    CornerRadiusVariant(
      variant: "8",
      cornerRadius: FluentCornerRadius.large,
      boxSize: 90,
    ),
    CornerRadiusVariant(
      variant: "12",
      cornerRadius: FluentCornerRadius.xLarge,
      boxSize: 120,
    ),
    CornerRadiusVariant(
      variant: "999",
      cornerRadius: FluentCornerRadius.circle,
      boxSize: FluentSize.size480.value,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
            title: "Fluent Shapes", subtitle: "Design Tokens > Shapes"),
      ),
      body: SafeArea(
        child: FluentContainer(
          child: Column(
            children: [
              FluentSectionHeader(title: "Corner Radius"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: FluentSize.size160.value),
                child:  Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: FluentSize.size280.value,
                  runSpacing: 12,
                  children: [
                    ...cornerRadiusVariants.map(
                          (value) => Column(
                        children: [
                          FluentCardContainer(
                            width: value.boxSize,
                            height: value.boxSize,
                            cornerRadius: value.cornerRadius,
                            margin:
                            EdgeInsets.only(bottom: FluentSize.size100.value),
                          ),
                          FluentText(value.variant),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              FluentSectionDescription(
                description:
                    "In most cases, corner radiuses on rectangle shapes are 4"
                    " pixels by default. For shapes smaller than 32 pixels, the corner angle"
                    " is reduced to 2 pixels. For large and extra-large components, 8 pixel and 12 pixel "
                    "angles are used. Follow iOS and Android guidelines for mobile contexts.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
