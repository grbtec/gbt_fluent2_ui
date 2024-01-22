import 'dart:ui';

T Function<T>(T light,T dark) createColorMode(Brightness brightness){
  T colorMode<T>(T light, T dark) => switch (brightness) {
    Brightness.light => light,
    Brightness.dark => dark,
  };
  return colorMode;
}