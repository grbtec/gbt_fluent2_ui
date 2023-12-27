import 'package:example/screens/dev_brunno/me_control/user_model.dart';

class FluentMeControlController {
  final List<UserModel> users;
  final void Function() onAddAccount;
  final void Function() onSignOut;
  FluentMeControlController(
      {required this.users,
      required this.onAddAccount,
      required this.onSignOut});
}
