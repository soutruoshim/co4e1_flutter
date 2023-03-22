import 'package:flutter/foundation.dart';

import '../models/article_model.dart';
import '../services/article_service.dart';


class ArticleLogic extends ChangeNotifier{
  ArticleModel? _articleModel;
  ArticleModel? get articleModel => _articleModel;

  String? _error;
  String? get error => _error;

  Future read() async{
    _articleModel = await ArticleService.getData(onError: (value){
      _error = value;
    });
    notifyListeners();
  }

  Future<bool> insert(Result item){
    return ArticleService.insert(item);
  }

  Future<bool> delete(Result item){
    return ArticleService.delete(item);
  }

  Future<bool> update(Result item){
    return ArticleService.update(item);
  }
}