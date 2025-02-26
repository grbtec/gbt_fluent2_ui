import 'dart:io';

void main() async {
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

  await Future.delayed(Duration(seconds: 1));

  final result1 = Process.runSync("git",["add", "."]);
  print(result1.stdout);
  print(result1.stderr);

  final result2 = Process.runSync("git",["commit", "-m", "build: remove private dependencies from pubspec.yaml and example/pubspec.yaml"]);
  print(result2.stdout);
  print(result2.stderr);
}
