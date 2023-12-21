<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/grbtec/gbt_fluent2_ui/cicd)

Fluent2 Design System Material based

## Features

- Default theme based on Fluent2
- Useful components (including the behavior)
- Almost no dependencies but Flutter

## Getting started

Documentation in progress...

## Before Start

Use the FluentProvider above your MaterialApp.

```dart

FluentProvider(
  child: MaterialApp(...),
);
```

#### The Scaffold
In order to make things work, make sure to always use FluentScaffold rather than Scaffold.

```dart

FluentScaffold(
  appBar: FluentNavBar(...),
  body: Placeholder(),
);
```

## Additional information

This is mainly inspired on the Fluent2 iOS Figma UI Kit. It will be gradually adapted to Android as soon as the Microsoft release its Figma UI Kit.