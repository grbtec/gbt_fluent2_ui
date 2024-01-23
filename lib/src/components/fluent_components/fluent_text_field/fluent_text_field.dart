import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_debug.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/src/components/fluent_components/fluent_text_field/text_field_trailing_icon.dart';

part 'fluent_text_field_controller.dart';

class FluentTextField extends StatefulWidget {
  final FluentTextFieldController? controller;
  final String? hintText;
  final String? label;
  final String? assistiveText;
  final Icon? suffixIcon;
  final void Function(String value)? onChanged;
  final bool readOnly;
  final bool hasError;
  final bool obscureText;

  const FluentTextField({
    super.key,
    this.controller,
    this.hintText,
    this.assistiveText,
    this.label,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
    this.hasError = false,
    this.obscureText = false,
  });

  @override
  State<FluentTextField> createState() => _FluentTextFieldState();
}

class _FluentTextFieldState extends State<FluentTextField> {
  late final FluentTextFieldController fluentTextFieldController;

  @override
  void initState() {
    super.initState();
    fluentTextFieldController =
        widget.controller ?? _InternalFluentTextFieldController();
  }

  @override
  void dispose() {
    if (fluentTextFieldController is _InternalFluentTextFieldController) {
      fluentTextFieldController.dispose();
    } else {
      // fluentTextFieldController.removeListener(controllerListener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as GbtFluentThemeData;
    final hintText = widget.hintText;
    final assistiveText = widget.assistiveText;
    final hasFocus = fluentTextFieldController.hasFocus;
    final isNotEmpty =
        fluentTextFieldController.textEditingController.value.text.isNotEmpty;
    final label = widget.label;
    final suffixIcon = widget.suffixIcon;
    final onChanged = widget.onChanged;

    return TextField(
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      focusNode: fluentTextFieldController._focus,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: fluentTextFieldController.textEditingController,
      onChanged: onChanged,
      cursorColor: colorMode(
        FluentColors.neutralForeground3Rest,
        FluentDarkColors.neutralForeground3Rest,
      ),
      style: fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
        fluentColor: hasFocus
            ? colorMode(
                FluentColors.neutralForeground1Rest,
                FluentDarkColors.neutralForeground1Rest,
              )
            : colorMode(
                FluentColors.neutralForeground2Rest,
                FluentDarkColors.neutralForeground2Rest,
              ),
      ),
      decoration: InputDecoration(
        label: label != null ? FluentText(label) : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: fluentTheme.fluentTextTheme?.caption2?.fluentCopyWith(
          fluentColor: widget.hasError
              ? colorMode(
                  FluentColors.statusDangerForeground2Rest,
                  FluentDarkColors.statusDangerForeground2Rest,
                )
              : fluentTheme.colorScheme.primary,
        ),
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        helperText: assistiveText,
        helperStyle: fluentTheme.fluentTextTheme?.caption2?.fluentCopyWith(
          fluentColor: widget.hasError
              ? colorMode(
                  FluentColors.statusDangerForeground2Rest,
                  FluentDarkColors.statusDangerForeground2Rest,
                )
              : colorMode(
                  FluentColors.neutralForeground2Rest,
                  FluentDarkColors.neutralForeground2Rest,
                ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.hasError
                ? colorMode(
                    FluentColors.statusDangerForeground2Rest,
                    FluentDarkColors.statusDangerForeground2Rest,
                  )
                : colorMode(
                    FluentColors.neutralStroke1Rest,
                    FluentDarkColors.neutralStroke1Rest,
                  ),
            width: FluentStrokeThickness.strokeWidth05.value,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: FluentStrokeThickness.strokeWidth05.value,
            color: widget.hasError
                ? colorMode(
                    FluentColors.statusDangerForeground2Rest,
                    FluentDarkColors.statusDangerForeground2Rest,
                  )
                : FluentColors.of(context)?.brandStroke1Rest ??
                    // ❕ Never reached fallback
                    Theme.of(context).primaryColor,
          ),
        ),
        hintStyle: fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
          fluentColor: hasFocus
              ? colorMode(
                  FluentColors.neutralForeground2Rest,
                  FluentDarkColors.neutralForeground2Rest,
                )
              : colorMode(
                  FluentColors.neutralForegroundDisabled1Rest,
                  FluentDarkColors.neutralForegroundDisabled1Rest,
                ),
        ),
        suffixIcon:widget.readOnly?null: TextFieldTrailingIcon(
          hasFocus: hasFocus,
          isNotEmpty: isNotEmpty,
          icon: suffixIcon,
          onTapCancelIcon: () {
            fluentTextFieldController.textEditingController.value =
                TextEditingValue(text: "");
          },
        ),
      ),
    );
  }
}

class _InternalFluentTextFieldController extends FluentTextFieldController {}
