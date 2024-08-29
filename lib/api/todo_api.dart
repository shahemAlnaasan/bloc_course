import 'dart:convert';

import 'package:bloc_course/todos_app/todo_class.dart';
import 'package:http/http.dart' as http;

class TodoApi {
  Future<List<Todo>> getAllApi() async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/todos/1';

      var response = await http.get(Uri.parse(url));

      List<Todo> todos = (json.decode(response.body))
          .map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo))
          .toList();

      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
