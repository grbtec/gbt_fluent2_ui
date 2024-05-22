part of 'fluent_sheet.dart';

Future<void> showFluentBottomSheet({
  required BuildContext context,
  required Widget child,
  bool half = false,
  Color? headerColor,
  Widget? headerTitle,
  Widget? headerLeading,
  Color? backgroundColor,
  Widget? headerTrailing,
  double headerHeight = 20,
  VoidCallback? onMaxExtent,
  Widget Function(BuildContext int, double size)? overlayBuilder,
}) {
  final controller = FluentSheetController();

  late BuildContext innerContext;
  late final DialogRoute route;
  route = DialogRoute(
    context: context,
    useSafeArea: false,
    builder: (context) {
      innerContext = context;
      return FluentSheet.bottom(
        half: half,
        controller: controller,
        headerTitle: headerTitle,
        headerColor: headerColor,
        backgroundColor: backgroundColor,
        headerTrailing: headerTrailing,
        headerLeading: headerLeading,
        headerHeight: headerHeight,
        onMinExtent: () {
          if (ModalRoute.of(context) == route) {
            Navigator.of(context).pop();
          }
        },
        onMaxExtent: onMaxExtent,
        child: child,
        overlayBuilder: overlayBuilder,
      );
    },
  );
  final future = Navigator.of(context).push(route).whenComplete(() {
    Future(() => controller.dispose());
  });

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if (innerContext.mounted) {
      controller.draggableScrollableController.animateTo(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  });
  return future;
}
