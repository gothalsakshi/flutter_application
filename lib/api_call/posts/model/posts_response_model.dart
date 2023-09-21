class PostsResponseModel {
  PostsResponseModel({
    required this.userId,
    required this.it,
    required this.title,
    required this.body,
  });
  late final int userId;
  late final int it;
  late final String title;
  late final String body;
  
  PostsResponseModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    it = json['it'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['it'] = it;
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}