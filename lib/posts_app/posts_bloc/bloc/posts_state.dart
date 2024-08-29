part of 'posts_bloc.dart';

enum PostStatus { loading, success, error }

class PostsState extends Equatable {
  final PostStatus status;
  final List<Posts> posts;
  final bool hasReachedMax;
  final String message;
  const PostsState({
    this.status = PostStatus.loading,
    this.hasReachedMax = false,
    this.message = "",
    this.posts = const [],
  });

  PostsState copyWiith({
    PostStatus? status,
    List<Posts>? posts,
    bool? hasReachedMax,
    String? message,
  }) {
    return PostsState(
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      message: message ?? this.message,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [status, hasReachedMax, message, posts];
}
