import 'package:bloc_course/bloc_file/bloc/counter_bloc.dart';
import 'package:bloc_course/bloc_file/internet_bloc/bloc/internet_bloc.dart';
import 'package:bloc_course/bloc_file/pages/home_page.dart';
import 'package:bloc_course/cubit_file/internet_cubit/cubit/internet_cubit.dart';
import 'package:bloc_course/cubit_file/pages/home.dart';
import 'package:bloc_course/helper/my_bloc_observer.dart';
import 'package:bloc_course/posts_app/posts_bloc/bloc/posts_bloc.dart';
import 'package:bloc_course/posts_app/posts_page.dart';
// import 'package:bloc_course/theme/theme_bloc/bloc/theme_bloc.dart';
import 'package:bloc_course/theme/theme_cubit/theme_cubit.dart';
import 'package:bloc_course/api/todo_api.dart';
import 'package:bloc_course/todos_app/todos_bloc/bloc/todos_bloc.dart';
import 'package:bloc_course/todos_app/todos_bloc/todos_v2/todos_v2_bloc.dart';
import 'package:bloc_course/todos_app/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          BlocProvider<InternetBloc>(create: (context) => InternetBloc()),
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit()..checkInternetConnection()),
          // BlocProvider<ThemeBloc>(
          //     create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
          BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit()..getCurrentTheme()),
          BlocProvider<TodosBloc>(
              create: (context) =>
                  TodosBloc(todoApi: TodoApi())..add(GetAllTodosEvent())),
          BlocProvider(
              create: (context) => PostsBloc()..add(GetAllPostsEvent())),
          BlocProvider(
              create: (context) =>
                  TodosV2Bloc()..add(const TodosV2Event.getAllTodos())),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            if (state is LoadedThemeState) {
              return MaterialApp(
                theme: state.themeData,
                home: const TodosPage(),
              );
            }
            return Container();
          },
        ));
  }
}
