import 'dart:convert';

import 'package:bloc_course/posts_app/past_model.dart';
import 'package:http/http.dart' as http;

class PostsApi {
  static Future<List<Posts>> getPosts(
      [int startIndex = 0, int limit = 20]) async {
    try {
      String url =
          "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit";

      var response = await http.get(Uri.parse(url));

      List<Posts> posts = (json.decode(response.body))
          .map<Posts>((jsonPost) => Posts.fromJson(jsonPost))
          .toList();

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
