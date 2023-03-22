import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ArticleService {
  static Future<ArticleModel?> getData({required void Function(String) onError}) async {

    const AndroidUrl = "http://10.0.2.2:8888/co4e1/read.php";
    const iOSUrl = "http://localhost:8888/co4e1/read.php";
    const realDeviceUrl = "http://192.168.0.195:8888/co4e1/read.php";
    try {
      http.Response response = await http.get(Uri.parse(iOSUrl));
      return compute(_getData, response.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }

  static Future<bool> insert(Result item) async {

    const AndroidUrl = "http://10.0.2.2:8888/co4e1/insert.php";
    const iOSUrl = "http://localhost:8888/co4e1/insert.php";
    const realDeviceUrl = "http://192.168.0.195:8888/co4e1/insert.php";
    try {
      http.Response response = await http.post(Uri.parse(iOSUrl), body: item.toJson());

      debugPrint(response.body.trim());

      if(response.body.trim() == "insert_success"){
        return true;
      }
      else{
        return false;
      }

    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }

  static Future<bool> delete(Result item) async {

    const AndroidUrl = "http://10.0.2.2:8888/co4e1/delete.php";
    const iOSUrl = "http://localhost:8888/co4e1/delete.php";
    const realDeviceUrl = "http://192.168.0.195:8888/co4e1/delete.php";
    try {
      http.Response response = await http.post(Uri.parse(iOSUrl), body: item.toJson());

      debugPrint(response.body.trim());

      if(response.body.trim() == "delete_success"){
        return true;
      }
      else{
        return false;
      }

    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }

  static Future<bool> update(Result item) async {

    const AndroidUrl = "http://10.0.2.2:8888/co4e1/update.php";
    const iOSUrl = "http://localhost:8888/co4e1/update.php";
    const realDeviceUrl = "http://192.168.0.195:8888/co4e1/update.php";
    try {
      http.Response response = await http.post(Uri.parse(iOSUrl), body: item.toJson());

      debugPrint(response.body.trim());

      if(response.body.trim() == "update_success"){
        return true;
      }
      else{
        return false;
      }

    } catch (e) {
      debugPrint("Error ${e.toString()}");
      return false;
    }
  }
}

ArticleModel _getData(String data) {
  Map<String, dynamic> map = json.decode(data);
  return ArticleModel.fromJson(map);
}
