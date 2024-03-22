class FluentCircularProgressIndicatorSize {
  final int index;
  final double value;

  const FluentCircularProgressIndicatorSize._(this.index, this.value);


  static const FluentCircularProgressIndicatorSize xSmall = FluentCircularProgressIndicatorSize._(0, 12);
  static const FluentCircularProgressIndicatorSize small = FluentCircularProgressIndicatorSize._(1, 16);
  static const FluentCircularProgressIndicatorSize medium = FluentCircularProgressIndicatorSize._(2, 24);
  static const FluentCircularProgressIndicatorSize large = FluentCircularProgressIndicatorSize._(3, 32);
  static const FluentCircularProgressIndicatorSize xLarge = FluentCircularProgressIndicatorSize._(4, 36);


  static const List<FluentCircularProgressIndicatorSize> values = <FluentCircularProgressIndicatorSize>[
    xSmall,
    small,
    medium,
    large,
    xLarge,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentCircularProgressIndicatorSize.xSmall',
      1: 'FluentCircularProgressIndicatorSize.small',
      2: 'FluentCircularProgressIndicatorSize.medium',
      3: 'FluentCircularProgressIndicatorSize.large',
      4: 'FluentCircularProgressIndicatorSize.xLarge',
    }[index]!;
  }
}
