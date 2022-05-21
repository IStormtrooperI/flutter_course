class ToDo{
  late int userId;
  late int id;
  late String title;
  late bool completed;

  ToDo.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    completed = json["completed"];
  }
}