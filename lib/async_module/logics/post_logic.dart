import 'package:c4e1/async_module/services/post_service.dart';
import 'package:flutter/foundation.dart';

import '../models/post_model.dart';

class PostLogic extends ChangeNotifier{
  List<PostModel>? _postList;
  List<PostModel>? get postList => _postList;

  String? _error;
  String? get error => _error;


  Future read() async{
    _postList = await PostService.getData(onError: (value){
      _error = value;
    });
    notifyListeners();
  }
}