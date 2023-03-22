import 'package:c4e1/randomuser_module/models/randomuser_model.dart';
import 'package:c4e1/randomuser_module/services/randomuser_service.dart';
import 'package:flutter/foundation.dart';


class RandomUserLogic extends ChangeNotifier{
  RandomUserModel? _randomUserModel;
  RandomUserModel? get randomUserModel => _randomUserModel;

  String? _error;
  String? get error => _error;

  Future read() async{
    _randomUserModel = await RandomUserService.getData(onError: (value){
      _error = value;
    });
    notifyListeners();
  }
}