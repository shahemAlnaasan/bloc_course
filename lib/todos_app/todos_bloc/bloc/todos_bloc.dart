import 'package:bloc/bloc.dart';
import 'package:bloc_course/api/todo_api.dart';
import 'package:bloc_course/todos_app/todo_class.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoApi todoApi;
  TodosBloc({required this.todoApi}) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todoApi.getAllApi();
          emit(LoadedState(todos));
        } catch (e) {
          emit(const ErrorState("Somthing went Wrong Please try again later"));
        }
      }
    });
  }
}
