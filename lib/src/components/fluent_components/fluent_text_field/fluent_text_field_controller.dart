part of 'fluent_text_field.dart';



class FluentTextFieldController {
  TextEditingController textEditingController = TextEditingController();
  @Deprecated("There is no sense of existing it here")
  bool _isLoading = false;
  FocusNode _focus = FocusNode();

  bool get hasFocus => _focus.hasFocus;

  @Deprecated("There is no sense of existing it here")
  String get queryString => textEditingController.value.text;

  @Deprecated("There is no sense of existing it here")
  void setQueryString(String queryString) {
    textEditingController.value = TextEditingValue(text: queryString);
  }

  @Deprecated("There is no sense of existing it here")
  void clearQueryString() {
    textEditingController.value = TextEditingValue(text: "");
  }
  @Deprecated("There is no sense of existing it here")
  void toggleIsLoading() {
    _isLoading = !_isLoading;
  }


  FluentTextFieldController() {
    if(GbtFluent2Debug.printIsEnabled) {
      _focus.addListener(() {
        print('focus changed: ${_focus.hasFocus}');
      });
    }
  }

  void dispose() {
    textEditingController.dispose();
    _focus.dispose();
  }
}

