part of 'fluent_tab_bar.dart';

class FluentTabBarItemNoLabel extends FluentTabBarItem {
  FluentTabBarItemNoLabel({
    required super.icon,
    super.showBadge = false,
    super.tooltip,
  }) : super._raw(
          label: null,
          axis: Axis.horizontal,
        );
}
