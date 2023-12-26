import 'dart:io';

var additionalLine =
    "publish_to: https://dart.pkg.jetbrains.space/grbtec-com/p/main/dart/";

void main() {
  final file = File("pubspec.yaml");
  final content = file.readAsStringSync();
  file.writeAsString(
    content.replaceFirst("version:", "$additionalLine\nversion:"),
  );
}
