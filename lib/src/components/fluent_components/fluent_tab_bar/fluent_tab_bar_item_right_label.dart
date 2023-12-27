part of 'fluent_tab_bar.dart';

class FluentTabBarItemRightLabel extends FluentTabBarItem {
  FluentTabBarItemRightLabel({
    required super.label,
    required super.icon,
    super.showBadge = false,
    super.tooltip,
  }) : super._raw(
          axis: Axis.horizontal,
        );
}
