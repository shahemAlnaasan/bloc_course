part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends TodosEvent {}

class GetTodoDetailsEvent extends TodosEvent {
  final int todosId;

  const GetTodoDetailsEvent({required this.todosId});

  @override
  List<Object> get props => [todosId];
}
