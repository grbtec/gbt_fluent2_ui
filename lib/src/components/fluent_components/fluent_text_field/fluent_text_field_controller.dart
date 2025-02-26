part of 'fluent_text_field.dart';

class FluentTextFieldController {
  TextEditingController textEditingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  ValueNotifier<bool> hasFocus = ValueNotifier(false);

  // bool get hasFocus => _focus.hasFocus;

  FluentTextFieldController() {
    _focus.addListener(() {
      hasFocus.value = _focus.hasFocus;
    });
  }

  void dispose() {
    textEditingController.dispose();
    _focus.dispose();
  }
}
