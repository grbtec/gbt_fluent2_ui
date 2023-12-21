class FluentAvatarSize {
  final int index;
  final double value;

  const FluentAvatarSize._(this.index, this.value);

  static const FluentAvatarSize size16 = FluentAvatarSize._(0, 16);
  static const FluentAvatarSize size20 = FluentAvatarSize._(0, 20);
  static const FluentAvatarSize size24 = FluentAvatarSize._(0, 24);
  static const FluentAvatarSize size28 = FluentAvatarSize._(0, 28);
  static const FluentAvatarSize size32 = FluentAvatarSize._(0, 32);
  static const FluentAvatarSize size36 = FluentAvatarSize._(0, 36);
  static const FluentAvatarSize size40 = FluentAvatarSize._(0, 40);
  static const FluentAvatarSize size48 = FluentAvatarSize._(0, 48);
  static const FluentAvatarSize size56 = FluentAvatarSize._(0, 56);
  static const FluentAvatarSize size64 = FluentAvatarSize._(0, 64);
  static const FluentAvatarSize size72 = FluentAvatarSize._(0, 72);
  static const FluentAvatarSize size96 = FluentAvatarSize._(0, 96);
  static const FluentAvatarSize size120 = FluentAvatarSize._(0, 120);
  static const FluentAvatarSize size128 = FluentAvatarSize._(0, 128);

  static const List<FluentAvatarSize> values = <FluentAvatarSize>[
    size16,
    size20,
    size24,
    size28,
    size32,
    size36,
    size40,
    size48,
    size56,
    size64,
    size72,
    size96,
    size120,
    size128,
  ];

  @override
  String toString() {
    return const <int, String>{
      0: 'FluentAvatarSize.size16',
      1: 'FluentAvatarSize.size20',
      2: 'FluentAvatarSize.size24',
      3: 'FluentAvatarSize.size28',
      4: 'FluentAvatarSize.size32',
      5: 'FluentAvatarSize.size36',
      6: 'FluentAvatarSize.size40',
      7: 'FluentAvatarSize.size48',
      8: 'FluentAvatarSize.size56',
      9: 'FluentAvatarSize.size64',
      10: 'FluentAvatarSize.size72',
      11: 'FluentAvatarSize.size96',
      12: 'FluentAvatarSize.size120',
      13: 'FluentAvatarSize.size128',
    }[index]!;
  }
}
