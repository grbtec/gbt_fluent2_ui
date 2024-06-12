part of 'fluent_popover.dart';

class FluentPopoverController {
  final overlayController = OverlayPortalController();

  void show() {
    overlayController.show();
  }

  void hide() {
    overlayController.hide();
  }
}
