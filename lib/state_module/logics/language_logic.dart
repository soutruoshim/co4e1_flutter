import 'package:flutter/foundation.dart';

import '../constants/language_constant.dart';

class LanguageLogic extends ChangeNotifier{

  Language _lang = Khmer();
  Language get lang => _lang;

  void changeToEnglish(){
    _lang = languageList[0];
    notifyListeners();
  }

  void changeToKhmer(){
    _lang = languageList[1];
    notifyListeners();
  }

  void changeToChinese(){
    _lang = languageList[2];
    notifyListeners();
  }
}