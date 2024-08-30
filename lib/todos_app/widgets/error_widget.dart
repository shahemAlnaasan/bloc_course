import 'package:bloc_course/todos_app/todos_bloc/bloc/todos_bloc.dart';
import 'package:bloc_course/todos_app/todos_bloc/todos_v2/todos_v2_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Errorwidget extends StatelessWidget {
  final String message;
  const Errorwidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodosV2Bloc>(context)
                    .add(TodosV2Event.getAllTodos());
              },
              child: const Text("Try Again"))
        ],
      ),
    );
  }
}
