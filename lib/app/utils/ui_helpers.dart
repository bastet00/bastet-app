import 'package:flutter/services.dart';

class UIHelpers {
  static void removeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
