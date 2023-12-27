class FluentStrokeThickness {
  const FluentStrokeThickness._(this.index, this.value);

  /// The encoded integer value of this stroke thickness.
  final int index;

  /// The thickness value.
  final double value;

  ///  StrokeWidthNone
  static const FluentStrokeThickness strokeWidthNone =
      FluentStrokeThickness._(0, 0);

  /// StrokeWidth05
  static const FluentStrokeThickness strokeWidth05 =
      FluentStrokeThickness._(1, 0.5);

  /// StrokeWidth10
  static const FluentStrokeThickness strokeWidth10 =
      FluentStrokeThickness._(2, 1);

  /// StrokeWidth15
  static const FluentStrokeThickness strokeWidth15 =
      FluentStrokeThickness._(2, 1.5);

  /// StrokeWidth20
  static const FluentStrokeThickness strokeWidth20 =
      FluentStrokeThickness._(2, 2);

  /// StrokeWidth30
  static const FluentStrokeThickness strokeWidth30 =
      FluentStrokeThickness._(2, 3);

  /// StrokeWidth40
  static const FluentStrokeThickness strokeWidth40 =
      FluentStrokeThickness._(2, 4);

  /// StrokeWidth60
  static const FluentStrokeThickness strokeWidth60 =
      FluentStrokeThickness._(2, 6);

  /// A list of all the thickness.
  static const List<FluentStrokeThickness> values = <FluentStrokeThickness>[
    strokeWidthNone,
    strokeWidth05,
    strokeWidth10,
    strokeWidth15,
    strokeWidth20,
    strokeWidth30,
    strokeWidth40,
    strokeWidth60,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentStrokeThickness.strokeWidthNone',
      1: 'FluentStrokeThickness.strokeWidth05',
      2: 'FluentStrokeThickness.strokeWidth10',
      3: 'FluentStrokeThickness.strokeWidth15',
      4: 'FluentStrokeThickness.strokeWidth20',
      5: 'FluentStrokeThickness.strokeWidth30',
      6: 'FluentStrokeThickness.strokeWidth40',
      7: 'FluentStrokeThickness.strokeWidth60',
    }[index]!;
  }
}
