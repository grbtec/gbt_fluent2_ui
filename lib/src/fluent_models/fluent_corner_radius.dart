class FluentCornerRadius {
  const FluentCornerRadius._(this.index, this.value);

  /// The encoded integer value of this corner radius.
  final int index;

  /// The rounded value of this corner radius.
  final double value;

  FluentCornerRadius(this.index, this.value);

  ///  None
  static const FluentCornerRadius none = FluentCornerRadius._(0, 0);

  /// Small
  static const FluentCornerRadius small = FluentCornerRadius._(1, 2);

  /// Medium
  static const FluentCornerRadius medium = FluentCornerRadius._(2, 4);

  /// Large
  static const FluentCornerRadius large = FluentCornerRadius._(3, 8);

  /// X-large
  static const FluentCornerRadius xLarge = FluentCornerRadius._(4, 12);

  /// Circle
  static const FluentCornerRadius circle = FluentCornerRadius._(5, 999);

  /// A list of all the corner radius.
  static const List<FluentCornerRadius> values = <FluentCornerRadius>[
    none,
    small,
    medium,
    large,
    xLarge,
    circle,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentFontWeight.none',
      1: 'FluentFontWeight.small',
      2: 'FluentFontWeight.medium',
      3: 'FluentFontWeight.large',
      4: 'FluentFontWeight.xLarge',
      5: 'FluentFontWeight.circle',
    }[index]!;
  }
}
