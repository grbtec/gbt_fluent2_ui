class FluentSize {
  final int index;
  final double value;

  const FluentSize._(this.index, this.value);

  static const FluentSize sizeNone = FluentSize._(0, 0);
  static const FluentSize size20 = FluentSize._(1, 2);
  static const FluentSize size40 = FluentSize._(1, 4);
  static const FluentSize size60 = FluentSize._(1, 6);
  static const FluentSize size80 = FluentSize._(1, 8);
  static const FluentSize size100 = FluentSize._(1, 10);
  static const FluentSize size120 = FluentSize._(1, 12);
  static const FluentSize size160 = FluentSize._(1, 16);
  static const FluentSize size200 = FluentSize._(1, 20);
  static const FluentSize size240 = FluentSize._(1, 24);
  static const FluentSize size280 = FluentSize._(1, 28);
  static const FluentSize size320 = FluentSize._(1, 32);
  static const FluentSize size360 = FluentSize._(1, 36);
  static const FluentSize size400 = FluentSize._(1, 40);
  static const FluentSize size480 = FluentSize._(1, 48);
  static const FluentSize size520 = FluentSize._(1, 52);
  static const FluentSize size560 = FluentSize._(1, 56);

  static const List<FluentSize> values = [
    sizeNone,
    size20,
    size40,
    size60,
    size80,
    size100,
    size120,
    size160,
    size200,
    size240,
    size280,
    size320,
    size360,
    size400,
    size480,
    size520,
    size560,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentSize.sizeNone',
      1: 'FluentSize.size20',
      2: 'FluentSize.size40',
      3: 'FluentSize.size60',
      4: 'FluentSize.size80',
      5: 'FluentSize.size100',
      6: 'FluentSize.size120',
      7: 'FluentSize.size160',
      8: 'FluentSize.size200',
      9: 'FluentSize.size240',
      10: 'FluentSize.size280',
      11: 'FluentSize.size320',
      12: 'FluentSize.size360',
      13: 'FluentSize.size400',
      14: 'FluentSize.size480',
      15: 'FluentSize.size20',
      16: 'FluentSize.size20',
    }[index]!;
  }
}
