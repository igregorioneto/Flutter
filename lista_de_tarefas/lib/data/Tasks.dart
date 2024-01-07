class Tasks {
  String title;
  String description;
  bool isDone;

  Tasks({required this.title, this.description = '', this.isDone = false});

  Tasks.fromJson(Map json) :
      title = json['title'],
      description = json['description'],
      isDone = json['isDone'];

  Map toJson() => {
    'title' : title,
    'description' : description,
    'isDone' : isDone
  };

}