import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part 'fluent_scaffold_bottom_sheet.dart';

part 'fluent_scaffold_messenger.dart';

part 'inherited_fluent_banner_state.dart';

class FluentScaffold extends Scaffold {
  FluentScaffold({
    super.key,
    super.appBar,
    super.body,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    // this.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary = true,
    super.drawerDragStartBehavior = DragStartBehavior.start,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture = true,
    super.endDrawerEnableOpenDragGesture = true,
    super.restorationId,
    PreferredSize? fluentBottomSheet,
  }) : super(
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FluentScaffoldBottomSheet(
                scaffoldHasTabBar: bottomNavigationBar != null,
              ),
              if (fluentBottomSheet != null)
                SizedBox(
                  width: fluentBottomSheet.preferredSize.width,
                  height: fluentBottomSheet.preferredSize.height,
                  child: fluentBottomSheet,
                )
            ],
          ),
        );
}
