import 'package:bloc_course/posts_app/past_model.dart';
import 'package:flutter/material.dart';

class PostistItem extends StatelessWidget {
  final Posts posts;

  const PostistItem({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(posts.id.toString()),
        title: Text(posts.title),
        isThreeLine: true,
        subtitle: Text(posts.body),
      ),
    );
  }
}
