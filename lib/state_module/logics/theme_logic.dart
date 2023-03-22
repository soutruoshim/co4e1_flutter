import 'package:flutter/foundation.dart';

class ThemeLogic extends ChangeNotifier{
  bool _dark = false;
  bool get dark => _dark;

  void toggle(){
    _dark = !_dark;
    notifyListeners();
  }
}