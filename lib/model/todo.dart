class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({this.id, this.todo, this.completed, this.userId});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['completed'] = this.completed;
    data['userId'] = this.userId;
    return data;
  }
}
//todo_app\lib\model\todo.dart