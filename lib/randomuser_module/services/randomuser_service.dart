import 'dart:convert';
import 'package:c4e1/randomuser_module/models/randomuser_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RandomUserService {
  static Future<RandomUserModel?> getData({required void Function(String) onError}) async {
    const url = "https://randomuser.me/api/?results=100&page=2";
    try {
      http.Response response = await http.get(Uri.parse(url));
      return compute(_getData, response.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }
}

RandomUserModel _getData(String data) {
  Map<String, dynamic> map = json.decode(data);
  return RandomUserModel.fromJson(map);

}
