class ArticleModel {
  late List<Result> results;

  ArticleModel({this.results = const []});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? aid;
  String? title;
  String? body;
  String? image;
  String? date;

  Result({this.aid, this.title, this.body, this.image, this.date});

  Result.fromJson(Map<String, dynamic> json) {
    aid = json['aid'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aid'] = this.aid;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}
