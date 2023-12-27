import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class NavHeader extends StatelessWidget {
  final headertext;
  final headersubtext;
  final headerpadding;
  final avatarbackgroundcolor;

  const NavHeader(
      {super.key,
      this.headerpadding,
      this.avatarbackgroundcolor,
      this.headersubtext,
      this.headertext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: headerpadding ?? 75),
      child: FluentListItemMultiLine(
        leading: FluentAvatar(
            child: CircleAvatar(
          backgroundColor: avatarbackgroundcolor ?? Colors.grey,
        )),
        text: headertext ?? "John Doe",
        subtext: headersubtext ?? "lorem ipsum dolor sit amet",
      ),
    );
  }
}
