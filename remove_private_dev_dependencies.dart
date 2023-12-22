import 'dart:io';

void main() {
  final file = File("pubspec.yaml");
  final content = file.readAsStringSync();
  file.writeAsString(
    content.replaceAll(RegExp(".+:(?:[^:]|[\n])+hosted: (?:.|[\n])+version: .+\..+\..+"), ""),
  );
}
