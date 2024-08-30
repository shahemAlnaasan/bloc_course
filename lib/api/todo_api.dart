import 'dart:convert';

import 'package:bloc_course/todos_app/todo_class.dart';
import 'package:http/http.dart' as http;

class TodoApi {
  static Future<List<Todo>> getAllApi() async {
    try {
      String url = 'https://jsonplaceholder.typicode.com/todos';

      var response = await http.get(Uri.parse(url));

      List<Todo> posts = (json.decode(response.body))
          .map<Todo>((jsonPost) => Todo.fromJson(jsonPost))
          .toList();

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
