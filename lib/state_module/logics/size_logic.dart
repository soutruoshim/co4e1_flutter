
import 'package:flutter/foundation.dart';

class SizeLogic extends ChangeNotifier{

  double _size = 0;
  double get size => _size;

  void increase(){
    _size++;
    notifyListeners();
  }

  void decrease(){
    _size--;
    notifyListeners();
  }
}