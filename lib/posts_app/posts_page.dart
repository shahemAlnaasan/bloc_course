import 'package:bloc_course/posts_app/posts_bloc/bloc/posts_bloc.dart';
import 'package:bloc_course/posts_app/widgets/post_list_item.dart';
import 'package:bloc_course/todos_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final double maxScroll = _scrollController.position.maxScrollExtent;

    final double currentScroll = _scrollController.offset;

    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<PostsBloc>().add(GetAllPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.status == PostStatus.loading) {
            return const LoadingWidget();
          } else if (state.status == PostStatus.success) {
            return ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.posts.length
                    : state.posts.length + 1,
                itemBuilder: (context, i) {
                  return i >= state.posts.length
                      ? const LoadingWidget()
                      : PostistItem(posts: state.posts[i]);
                });
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
