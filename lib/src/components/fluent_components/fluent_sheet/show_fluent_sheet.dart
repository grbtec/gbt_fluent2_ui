part of 'fluent_sheet.dart';

void showFluentBottomSheet({
  required BuildContext context,
  required Widget child,
  bool half = false,
  Color? headerColor,
  Widget? headerTitle,
  Widget? headerLeading,
  Color? backgroundColor,
  Widget? headerTrailing,
}){

  final controller = FluentSheetController();

  late BuildContext innerContext;
  late final DialogRoute route;
  route = DialogRoute(context: context, builder: (context) {
    innerContext = context;
    return FluentSheet.bottom(
      half: half,
      controller: controller,
      headerTitle: headerTitle,
      headerColor: headerColor,
      backgroundColor: backgroundColor,
      headerTrailing: headerTrailing,
      headerLeading: headerLeading,
      onMinExtent: () {
        if(ModalRoute.of(context) == route){
          Navigator.of(context).pop();
        }
      },
      child: child,
    );
  },);
  Navigator.of(context).push(route).whenComplete(() {
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
}