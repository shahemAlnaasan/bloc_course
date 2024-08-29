class Todo {
  int userId;
  String title;
  bool completed;

  Todo({required this.userId, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = userId;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
