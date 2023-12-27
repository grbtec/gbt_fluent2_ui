abstract interface class FluentShadow {
  final double blurShadow1;
  final double blurShadow2;
  final double xAxis;
  final double yAxisShadow1;
  final double yAxisShadow2;
  final double opacityShadow1;
  final double opacityShadow2;

  FluentShadow(
      {required this.blurShadow1,
      required this.blurShadow2,
      required this.xAxis,
      required this.yAxisShadow1,
      required this.yAxisShadow2,
      required this.opacityShadow1,
      required this.opacityShadow2});
}
