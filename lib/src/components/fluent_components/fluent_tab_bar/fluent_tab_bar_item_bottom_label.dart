part of 'fluent_tab_bar.dart';

class FluentTabBarItemBottomLabel extends FluentTabBarItem {
  FluentTabBarItemBottomLabel({
    required super.label,
    required super.icon,
    super.showBadge = false,
    super.tooltip,
  }) : super._raw(
          axis: Axis.vertical,
        );
}
