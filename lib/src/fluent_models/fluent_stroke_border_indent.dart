class FluentStrokeBorderIndent {
  /// The encoded integer value of this stroke border indent.
  final int index;

  /// The border indent value.
  final double value;

  const FluentStrokeBorderIndent._(
    this.index,
    this.value,
  );

  static const FluentStrokeBorderIndent strokeIndent0 =
      FluentStrokeBorderIndent._(1, 0);

  static const FluentStrokeBorderIndent strokeIndent16 =
      FluentStrokeBorderIndent._(1, 16);

  static const FluentStrokeBorderIndent strokeIndent56 =
      FluentStrokeBorderIndent._(1, 56);

  static const FluentStrokeBorderIndent strokeIndent68 =
      FluentStrokeBorderIndent._(1, 68);

  static const FluentStrokeBorderIndent strokeIndent72 =
      FluentStrokeBorderIndent._(1, 72);

  static const FluentStrokeBorderIndent strokeIndent108 =
      FluentStrokeBorderIndent._(1, 108);

  /// A list of all the stroke indents.
  static const List<FluentStrokeBorderIndent> values =
      <FluentStrokeBorderIndent>[
    strokeIndent0,
    strokeIndent16,
    strokeIndent56,
    strokeIndent68,
    strokeIndent72,
    strokeIndent108,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentStrokeBorderIndent.strokeIndent0',
      1: 'FluentStrokeBorderIndent.strokeIndent16',
      2: 'FluentStrokeBorderIndent.strokeIndent56',
      3: 'FluentStrokeBorderIndent.strokeIndent68',
      4: 'FluentStrokeBorderIndent.strokeIndent72',
      5: 'FluentStrokeBorderIndent.strokeIndent108',
    }[index]!;
  }
}
