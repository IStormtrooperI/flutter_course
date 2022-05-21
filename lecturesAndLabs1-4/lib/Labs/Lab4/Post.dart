class Post{
  late int userId;
  late int id;
  late String title;
  late String body;

  Post.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}