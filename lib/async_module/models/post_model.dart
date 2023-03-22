class PostModel {
  late int userId;
  late int id;
  late String title;
  late String body;

  PostModel({
    this.userId = 0,
    this.id = 0,
    this.title = "no title",
    this.body = "no body",
  });

  PostModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
