part of 'fluent_tab_bar.dart';

class FluentTabBarController extends ValueNotifier<int> {
  FluentTabBarController([super.value = 0]);

  void select(int index) {
    value = index;
  }
}

class _InternalFluentTabBarController extends FluentTabBarController {}
