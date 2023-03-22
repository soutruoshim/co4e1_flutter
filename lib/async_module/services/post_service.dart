import 'dart:convert';
import 'package:c4e1/async_module/models/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<PostModel>?> getData({required void Function(String) onError}) async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    try {
      http.Response response = await http.get(Uri.parse(url));
      return compute(_getList, response.body);
    } catch (e) {
      onError(e.toString());
    }
    return null;
  }
}

List<PostModel> _getList(String data) {
  List list = json.decode(data);
  List<PostModel> postList = [];
  for (int index = 0; index < list.length; index++) {
    PostModel post = PostModel.fromJson(list[index]);
    postList.add(post);
  }
  return postList;
}
