import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentHeadsUpDisplay extends StatefulWidget {
  final String? text;

  const FluentHeadsUpDisplay({
    super.key,
    this.text,
  });

  @override
  State<FluentHeadsUpDisplay> createState() => _FluentHeadsUpDisplayState();
}

class _FluentHeadsUpDisplayState extends State<FluentHeadsUpDisplay> {
  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 192,
        maxHeight: text == null ? 100 : 108,
        minWidth: text == null ? 100 : 108,
        minHeight: text == null ? 100 : 108,
      ),
      child: FluentContainer(
        color: FluentColors.neutralBackgroundStaticDarkRest,
        cornerRadius: FluentCornerRadius.medium,
        child: Padding(
          padding: EdgeInsets.all(
            FluentSize.size160.value,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: FluentColors.controlsHudForeground2,
              ),
              if (text != null) ...[
                SizedBox(
                  height: 12,
                ),
                FluentText(
                  text,
                  style: GbtFluentThemeData.of(context)
                      .fluentTextTheme
                      ?.body1
                      ?.fluentCopyWith(
                        fluentColor: FluentColors.neutralForegroundStaticLight,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
