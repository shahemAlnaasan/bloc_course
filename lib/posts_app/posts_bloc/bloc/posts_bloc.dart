import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_course/api/posts_api.dart';
import 'package:bloc_course/todos_app/todos_bloc/bloc/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_course/posts_app/past_model.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == PostStatus.loading) {
            final posts = await PostsApi.getPosts();
            return posts.isEmpty
                ? emit(state.copyWiith(
                    hasReachedMax: true, status: PostStatus.success))
                : emit(state.copyWiith(
                    status: PostStatus.success,
                    posts: posts,
                    hasReachedMax: false,
                  ));
          } else {
            final posts = await PostsApi.getPosts(state.posts.length);
            posts.isEmpty
                ? emit(state.copyWiith(hasReachedMax: true))
                : emit(state.copyWiith(
                    status: PostStatus.success,
                    posts: List.of(state.posts)..addAll(posts),
                    hasReachedMax: false,
                  ));
          }
        } catch (e) {
          emit(state.copyWiith(status: PostStatus.error, message: "Error"));
        }
      }
    }, transformer: droppable());
  }
}
