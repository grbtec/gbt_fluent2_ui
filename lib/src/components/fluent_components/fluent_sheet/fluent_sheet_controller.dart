part of 'fluent_sheet.dart';

class _InternalFluentSheetController extends FluentSheetController {}

class FluentSheetController extends ChangeNotifier {
  bool _initialized = false;
  final DraggableScrollableController draggableScrollableController;

  FluentSheetController({
    DraggableScrollableController? draggableScrollableController,
  }) : draggableScrollableController =
            draggableScrollableController ?? DraggableScrollableController();

  void _init() {
    draggableScrollableController.addListener(draggableListener);
  }

  @override
  void addListener(VoidCallback listener) {
    if (!_initialized) {
      _init();
      _initialized = true;
    }
    super.addListener(listener);
  }

  void draggableListener() {
    notifyListeners();
  }

  @override
  void dispose() {
    draggableScrollableController.dispose();
    super.dispose();
  }
}
