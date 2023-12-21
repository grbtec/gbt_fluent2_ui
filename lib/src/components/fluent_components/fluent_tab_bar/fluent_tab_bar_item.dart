part of 'fluent_tab_bar.dart';

abstract class FluentTabBarItem {
  final Widget icon;
  final String? label;
  final String? tooltip;
  final bool showBadge;
  final Axis _axis;

  FluentTabBarItem._raw({
    required this.label,
    required this.icon,
    required this.showBadge,
    required this.tooltip,
    required Axis axis,
  }) : _axis = axis;
}
