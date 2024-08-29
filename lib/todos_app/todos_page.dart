import 'package:bloc_course/todos_app/todos_bloc/bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/error_widget.dart';
import 'widgets/loading_widget.dart';
import 'widgets/todos_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Todos"),
        ),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return TodosWidget(todos: state.todos);
          } else if (state is ErrorState) {
            return Errorwidget(message: state.message);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
