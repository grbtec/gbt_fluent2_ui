import 'dart:io';

void main() {
  final file = File("pubspec.yaml");
  final content = file.readAsStringSync();
  file.writeAsString(
    content.replaceAll(
        RegExp(".+:(?:[^:]|[\n])+hosted: (?:.|[\n])+version: .+\..+\..+"), ""),
  );

  final file2 = File("example/pubspec.yaml");
  final content2 = file2.readAsStringSync();
  file2.writeAsString(
    content2.replaceAll(
        RegExp(".+:(?:[^:]|[\n])+hosted: .+:\/\/[^:]+version: .+\..+\..+"), ""),
  );
}
