import 'package:bloc_course/todos_app/todo_class.dart';
import 'package:flutter/material.dart';

class TodosWidget extends StatelessWidget {
  final List<Todo> todos;
  const TodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("${todos[i].id}"),
          ),
          title: Text(todos[i].title),
          trailing: todos[i].completed ? const Icon(Icons.done) : null,
        );
      },
    );
  }
}
