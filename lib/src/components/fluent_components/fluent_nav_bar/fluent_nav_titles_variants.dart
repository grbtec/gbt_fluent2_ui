import 'package:flutter/material.dart';

/// Titles variants interface
abstract interface class NavTitleVariation {
  Widget? get avatar;

  String get title;

  String? get subtitle;
}

/// Left title
class NavLeftTitle extends NavTitleVariation {
  @override
  final Widget? avatar;

  @override
  final String? subtitle;

  @override
  final String title;

  /// NavBarLeftTitle's constructor
  NavLeftTitle({
    required this.title,
    this.avatar,
  }) : subtitle = null;
}

/// Left title with subtitle
class NavLeftSubtitle extends NavTitleVariation {
  @override
  final Widget? avatar;

  @override
  final String subtitle;

  @override
  final String title;

  /// NavBarLeftTitle's constructor
  NavLeftSubtitle({
    required this.title,
    required this.subtitle,
    this.avatar,
  });
}

/// Center title
class NavCenterTitle extends NavTitleVariation {
  @override
  final Widget? avatar;

  @override
  final String? subtitle;

  @override
  final String title;

  /// NavCenterTitle's constructor
  NavCenterTitle({
    required this.title,
  })  : subtitle = null,
        avatar = null;
}

/// Center title with subtitle
class NavCenterSubtitle extends NavTitleVariation {
  @override
  final String subtitle;

  @override
  final String title;

  @override
  final Widget? avatar;

  /// NavCenterSubtitle's constructor
  NavCenterSubtitle({
    required this.title,
    required this.subtitle,
  }) : avatar = null;
}
