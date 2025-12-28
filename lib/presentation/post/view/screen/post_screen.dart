import 'package:expense_tracker/domain/entity/post_entity.dart';
import 'package:expense_tracker/presentation/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();

    // 🔥 Trigger initial load
    context.read<PostBloc>().add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostBloc>().add(FetchPostsEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case PostStatus.failure:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.errorMessage ?? 'Something went wrong',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(FetchPostsEvent());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );

            case PostStatus.success:
              return _buildPostList(state.posts);

            case PostStatus.initial:
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  // ---------- UI LIST ----------
  Widget _buildPostList(List<PostEntity> posts) {
    if (posts.isEmpty) {
      return const Center(child: Text('No posts available'));
    }

    return ListView.separated(
      itemCount: posts.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final post = posts[index];

        return ListTile(
          title: Text(post.title ?? ""),
          subtitle: Text(
            post.body ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text('User ${post.userId}'),
        );
      },
    );
  }
}
