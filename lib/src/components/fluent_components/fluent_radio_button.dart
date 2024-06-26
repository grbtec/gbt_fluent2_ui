import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentRadioButton<T> extends StatefulWidget {
  /// The radio button itself does not maintain any state. Instead, when the
  /// radio button is selected, the widget calls the [onChanged] callback. Most
  /// widgets that use a radio button will listen for the [onChanged] callback
  /// and rebuild the radio button with a new [groupValue] to update the visual
  /// appearance of the radio button.
  ///
  /// The following arguments are required:
  ///
  /// * [value] and [groupValue] together determine whether the radio button is
  ///   selected.
  /// * [onChanged] is called when the user selects this radio button.
  const FluentRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.semanticLabel,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
  }) : useCupertinoCheckmarkStyle = false;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Called when the user selects this radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio button with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// Radio<SingingCharacter>(
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter? newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<T?>? onChanged;

  /// {@template flutter.material.radio.mouseCursor}
  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [WidgetStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  /// {@endtemplate}
  ///
  /// If null, then the value of [RadioThemeData.mouseCursor] is used.
  /// If that is also null, then [WidgetStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [WidgetStateMouseCursor], a [MouseCursor] that implements
  ///    `WidgetStateProperty` which is used in APIs that need to accept
  ///    either a [MouseCursor] or a [WidgetStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// Set to true if this radio button is allowed to be returned to an
  /// indeterminate state by selecting it again when selected.
  ///
  /// To indicate returning to an indeterminate state, [onChanged] will be
  /// called with null.
  ///
  /// If true, [onChanged] can be called with [value] when selected while
  /// [groupValue] != [value], or with null when selected again while
  /// [groupValue] == [value].
  ///
  /// If false, [onChanged] will be called with [value] when it is selected
  /// while [groupValue] != [value], and only by selecting another radio button
  /// in the group (i.e. changing the value of [groupValue]) can this radio
  /// button be unselected.
  ///
  /// The default is false.
  ///
  /// {@tool dartpad}
  /// This example shows how to enable deselecting a radio button by setting the
  /// [toggleable] attribute.
  ///
  /// ** See code in examples/api/lib/material/radio/radio.toggleable.0.dart **
  /// {@end-tool}
  final bool toggleable;

  /// The color to use when this radio button is selected.
  ///
  /// Defaults to [ColorScheme.secondary].
  ///
  /// If [fillColor] returns a non-null color in the [WidgetState.selected]
  /// state, it will be used instead of this color.
  final Color? activeColor;

  /// {@template flutter.material.radio.fillColor}
  /// The color that fills the radio button, in all [WidgetState]s.
  ///
  /// Resolves in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [fillColor] based on the current [WidgetState]
  /// of the [Radio], providing a different [Color] when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Radio<int>(
  ///   value: 1,
  ///   groupValue: 1,
  ///   onChanged: (_){},
  ///   fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  ///     if (states.contains(WidgetState.disabled)) {
  ///       return Colors.orange.withOpacity(.32);
  ///     }
  ///     return Colors.orange;
  ///   })
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] is used in the selected state. If
  /// that is also null, then the value of [RadioThemeData.fillColor] is used.
  /// If that is also null, then [ThemeData.disabledColor] is used in
  /// the disabled state, [ColorScheme.secondary] is used in the
  /// selected state, and [ThemeData.unselectedWidgetColor] is used in the
  /// default state.
  final WidgetStateProperty<Color?>? fillColor;

  /// {@template flutter.material.radio.materialTapTargetSize}
  /// Configures the minimum size of the tap target.
  /// {@endtemplate}
  ///
  /// If null, then the value of [RadioThemeData.materialTapTargetSize] is used.
  /// If that is also null, then the value of [ThemeData.materialTapTargetSize]
  /// is used.
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@template flutter.material.radio.visualDensity}
  /// Defines how compact the radio's layout will be.
  /// {@endtemplate}
  ///
  /// {@macro flutter.material.themedata.visualDensity}
  ///
  /// If null, then the value of [RadioThemeData.visualDensity] is used. If that
  /// is also null, then the value of [ThemeData.visualDensity] is used.
  ///
  /// See also:
  ///
  ///  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
  ///    widgets within a [Theme].
  final VisualDensity? visualDensity;

  /// The color for the radio's [Material] when it has the input focus.
  ///
  /// If [overlayColor] returns a non-null color in the [WidgetState.focused]
  /// state, it will be used instead.
  ///
  /// If null, then the value of [RadioThemeData.overlayColor] is used in the
  /// focused state. If that is also null, then the value of
  /// [ThemeData.focusColor] is used.
  final Color? focusColor;

  /// {@template flutter.material.radio.hoverColor}
  /// The color for the radio's [Material] when a pointer is hovering over it.
  ///
  /// If [overlayColor] returns a non-null color in the [WidgetState.hovered]
  /// state, it will be used instead.
  /// {@endtemplate}
  ///
  /// If null, then the value of [RadioThemeData.overlayColor] is used in the
  /// hovered state. If that is also null, then the value of
  /// [ThemeData.hoverColor] is used.
  final Color? hoverColor;

  /// {@template flutter.material.radio.overlayColor}
  /// The color for the radio's [Material].
  ///
  /// Resolves in the following states:
  ///  * [WidgetState.pressed].
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] with alpha
  /// [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
  /// pressed, focused and hovered state. If that is also null,
  /// the value of [RadioThemeData.overlayColor] is used. If that is also null,
  /// then the value of [ColorScheme.secondary] with alpha
  /// [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
  /// is used in the pressed, focused and hovered state.
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@template flutter.material.radio.splashRadius}
  /// The splash radius of the circular [Material] ink response.
  /// {@endtemplate}
  ///
  /// If null, then the value of [RadioThemeData.splashRadius] is used. If that
  /// is also null, then [kRadialReactionRadius] is used.
  final double? splashRadius;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Controls whether the checkmark style is used in an iOS-style radio.
  ///
  /// Only usable under the [Radio.adaptive] constructor. If set to true, on
  /// Apple platforms the radio button will appear as an iOS styled checkmark.
  /// Controls the [CupertinoRadio] through [CupertinoRadio.useCheckmarkStyle].
  ///
  /// Defaults to false.
  final bool useCupertinoCheckmarkStyle;

  bool get _selected => value == groupValue;

  /// semanticLabel is for accessibility
  final String? semanticLabel;

  @override
  State<FluentRadioButton<T>> createState() => _FluentRadioButtonState<T>();
}

class _FluentRadioButtonState<T> extends State<
    FluentRadioButton<T>> // with TickerProviderStateMixin, ToggleableStateMixin
{
  final _RadioPainter _painter = _RadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  void _handleTap([Intent? _]) {
    if (!isInteractive) {
      return;
    }
    switch (value) {
      case false:
        onChanged!(true);
      case true:
        onChanged!(tristate ? null : false);
      case null:
        onChanged!(false);
    }
    context.findRenderObject()!.sendSemanticsEvent(const TapSemanticEvent());
  }

  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  void didUpdateWidget(FluentRadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      // animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  bool get tristate => widget.toggleable;

  bool? get value => widget._selected;

  // WidgetStateProperty<Color?> get _widgetFillColor {
  //   return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
  //     if (states.contains(WidgetState.disabled)) {
  //       return null;
  //     }
  //     if (states.contains(WidgetState.selected)) {
  //       return widget.activeColor;
  //     }
  //     return null;
  //   });
  // }

  /// The control is considered interactive if the [onChanged] callback is
  /// non-null. If the callback is null, then the control is disabled, and
  /// non-interactive. A disabled checkbox, for example, is displayed using a
  /// grey color and its value cannot be changed.
  bool get isInteractive => onChanged != null;

  Set<WidgetState> get states => <WidgetState>{
        if (!isInteractive) WidgetState.disabled,
        if (widget.focusNode?.hasFocus ?? false) WidgetState.focused,
        if (value ?? true) WidgetState.selected,
      };

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    assert(debugCheckHasMaterial(context));
    // final RadioThemeData radioTheme = RadioTheme.of(context);
    // final RadioThemeData defaults = Theme.of(context).useMaterial3
    //     ? _RadioDefaultsM3(context)
    //     : _RadioDefaultsM2(context);
    // final MaterialTapTargetSize effectiveMaterialTapTargetSize =
    //     widget.materialTapTargetSize ??
    //         radioTheme.materialTapTargetSize ??
    //         defaults.materialTapTargetSize!;
    // final VisualDensity effectiveVisualDensity = widget.visualDensity ??
    //     radioTheme.visualDensity ??
    //     defaults.visualDensity!;
    // Size size;
    // switch (effectiveMaterialTapTargetSize) {
    //   case MaterialTapTargetSize.padded:
    //     size = const Size(kMinInteractiveDimension, kMinInteractiveDimension);
    //   case MaterialTapTargetSize.shrinkWrap:
    //     size = const Size(
    //         kMinInteractiveDimension - 8.0, kMinInteractiveDimension - 8.0);
    // }
    // size += effectiveVisualDensity.baseSizeAdjustment;

    // Colors need to be resolved in selected and non selected states separately
    // so that they can be lerped between.
    // final Set<WidgetState> activeStates = states..add(WidgetState.selected);
    // final Set<WidgetState> inactiveStates = states
    //   ..remove(WidgetState.selected);
    // final Color? activeColor = widget.fillColor?.resolve(activeStates) ??
    //     _widgetFillColor.resolve(activeStates) ??
    //     radioTheme.fillColor?.resolve(activeStates);
    // final Color effectiveActiveColor =
    //     activeColor ?? defaults.fillColor!.resolve(activeStates)!;
    // final Color? inactiveColor = widget.fillColor?.resolve(inactiveStates) ??
    //     _widgetFillColor.resolve(inactiveStates) ??
    //     radioTheme.fillColor?.resolve(inactiveStates);
    // final Color effectiveInactiveColor =
    //     inactiveColor ?? defaults.fillColor!.resolve(inactiveStates)!;

    // final Set<WidgetState> focusedStates = states..add(WidgetState.focused);
    // Color effectiveFocusOverlayColor =
    //     widget.overlayColor?.resolve(focusedStates) ??
    //         widget.focusColor ??
    //         radioTheme.overlayColor?.resolve(focusedStates) ??
    //         defaults.overlayColor!.resolve(focusedStates)!;

    // final Set<WidgetState> hoveredStates = states..add(WidgetState.hovered);
    // Color effectiveHoverOverlayColor =
    //     widget.overlayColor?.resolve(hoveredStates) ??
    //         widget.hoverColor ??
    //         radioTheme.overlayColor?.resolve(hoveredStates) ??
    //         defaults.overlayColor!.resolve(hoveredStates)!;

    // final Set<WidgetState> activePressedStates = activeStates
    //   ..add(WidgetState.pressed);
    // final Color effectiveActivePressedOverlayColor =
    //     widget.overlayColor?.resolve(activePressedStates) ??
    //         radioTheme.overlayColor?.resolve(activePressedStates) ??
    //         activeColor?.withAlpha(kRadialReactionAlpha) ??
    //         defaults.overlayColor!.resolve(activePressedStates)!;

    // final Set<WidgetState> inactivePressedStates = inactiveStates
    //   ..add(WidgetState.pressed);
    // final Color effectiveInactivePressedOverlayColor =
    //     widget.overlayColor?.resolve(inactivePressedStates) ??
    //         radioTheme.overlayColor?.resolve(inactivePressedStates) ??
    //         inactiveColor?.withAlpha(kRadialReactionAlpha) ??
    //         defaults.overlayColor!.resolve(inactivePressedStates)!;

    final bool? accessibilitySelected;
    // Apple devices also use `selected` to annotate radio button's semantics
    // state.

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        accessibilitySelected = null;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        accessibilitySelected = widget._selected;
    }

    return Semantics(
      label: widget.semanticLabel,
      enabled: true,
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      selected: accessibilitySelected,
      child: GestureDetector(
        excludeFromSemantics: !isInteractive,
        behavior: HitTestBehavior.translucent,
        onTap: _handleTap,
        child: Container(
          width: FluentSize.size240.value,
          height: FluentSize.size240.value,
          child: widget._selected
              ? Icon(
                  Icons.check,
                  color: isInteractive
                      ? FluentColors.of(context)?.brandForeground1Rest
                      : colorMode(
                          FluentColors.neutralForegroundDisabled1Rest,
                          FluentDarkColors.neutralForegroundDisabled1Rest,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}

// Hand coded defaults based on Material Design 2.
// class _RadioDefaultsM2 extends RadioThemeData {
//   _RadioDefaultsM2(this.context);
//
//   final BuildContext context;
//   late final ThemeData _theme = Theme.of(context);
//   late final ColorScheme _colors = _theme.colorScheme;
//
//   @override
//   WidgetStateProperty<Color> get fillColor {
//     return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
//       if (states.contains(WidgetState.disabled)) {
//         return _theme.disabledColor;
//       }
//       if (states.contains(WidgetState.selected)) {
//         return _colors.secondary;
//       }
//       return _theme.unselectedWidgetColor;
//     });
//   }
//
//   @override
//   WidgetStateProperty<Color> get overlayColor {
//     return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
//       if (states.contains(WidgetState.pressed)) {
//         return fillColor.resolve(states).withAlpha(kRadialReactionAlpha);
//       }
//       if (states.contains(WidgetState.hovered)) {
//         return _theme.hoverColor;
//       }
//       if (states.contains(WidgetState.focused)) {
//         return _theme.focusColor;
//       }
//       return Colors.transparent;
//     });
//   }
//
//   @override
//   MaterialTapTargetSize get materialTapTargetSize =>
//       _theme.materialTapTargetSize;
//
//   @override
//   VisualDensity get visualDensity => _theme.visualDensity;
// }

// BEGIN GENERATED TOKEN PROPERTIES - Radio<T>

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

// class _RadioDefaultsM3 extends RadioThemeData {
//   _RadioDefaultsM3(this.context);
//
//   final BuildContext context;
//   late final ThemeData _theme = Theme.of(context);
//   late final ColorScheme _colors = _theme.colorScheme;
//
//   @override
//   WidgetStateProperty<Color> get fillColor {
//     return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
//       if (states.contains(WidgetState.selected)) {
//         if (states.contains(WidgetState.disabled)) {
//           return _colors.onSurface.withOpacity(0.38);
//         }
//         if (states.contains(WidgetState.pressed)) {
//           return _colors.primary;
//         }
//         if (states.contains(WidgetState.hovered)) {
//           return _colors.primary;
//         }
//         if (states.contains(WidgetState.focused)) {
//           return _colors.primary;
//         }
//         return _colors.primary;
//       }
//       if (states.contains(WidgetState.disabled)) {
//         return _colors.onSurface.withOpacity(0.38);
//       }
//       if (states.contains(WidgetState.pressed)) {
//         return _colors.onSurface;
//       }
//       if (states.contains(WidgetState.hovered)) {
//         return _colors.onSurface;
//       }
//       if (states.contains(WidgetState.focused)) {
//         return _colors.onSurface;
//       }
//       return _colors.onSurfaceVariant;
//     });
//   }
//
//   @override
//   WidgetStateProperty<Color> get overlayColor {
//     return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
//       if (states.contains(WidgetState.selected)) {
//         if (states.contains(WidgetState.pressed)) {
//           return _colors.onSurface.withOpacity(0.12);
//         }
//         if (states.contains(WidgetState.hovered)) {
//           return _colors.primary.withOpacity(0.08);
//         }
//         if (states.contains(WidgetState.focused)) {
//           return _colors.primary.withOpacity(0.12);
//         }
//         return Colors.transparent;
//       }
//       if (states.contains(WidgetState.pressed)) {
//         return _colors.primary.withOpacity(0.12);
//       }
//       if (states.contains(WidgetState.hovered)) {
//         return _colors.onSurface.withOpacity(0.08);
//       }
//       if (states.contains(WidgetState.focused)) {
//         return _colors.onSurface.withOpacity(0.12);
//       }
//       return Colors.transparent;
//     });
//   }
//
//   @override
//   MaterialTapTargetSize get materialTapTargetSize =>
//       _theme.materialTapTargetSize;
//
//   @override
//   VisualDensity get visualDensity => _theme.visualDensity;
// }

// END GENERATED TOKEN PROPERTIES - Radio<T>

class _RadioPainter extends ToggleablePainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Offset center = (Offset.zero & size).center;

    // Outer circle
    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, activeColor, position.value)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, _kOuterRadius, paint);

    // Inner circle
    if (!position.isDismissed) {
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(center, _kInnerRadius * position.value, paint);
    }
  }
}

const double _kOuterRadius = 8.0;
const double _kInnerRadius = 4.5;
