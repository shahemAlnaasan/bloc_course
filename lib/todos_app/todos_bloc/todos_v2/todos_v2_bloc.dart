// import 'package:bloc_course/api/todo_api.dart';
import 'package:bloc_course/api/todo_api.dart';
import 'package:bloc_course/todos_app/todo_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos_v2_state.dart';
part 'todos_v2_event.dart';
part 'todos_v2_bloc.freezed.dart';

class TodosV2Bloc extends Bloc<TodosV2Event, TodosV2State> {
  TodosV2Bloc() : super(const TodosV2State.loading()) {
    on<TodosV2Event>((event, emit) async {
      await event.when(
        getAllTodos: () async {
          emit(const TodosV2State.loading());
          try {
            final todos = await TodoApi.getAllApi();
            emit(TodosV2State.loaded(todos));
          } catch (e) {
            emit(const TodosV2State.error("ERror"));
          }
        },
        getTodoDetails: (todoId) {},
      );
    });
  }
}
