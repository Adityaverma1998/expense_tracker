part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  final PostStatus status;
  final List<PostEntity> posts;
  final String? errorMessage;

  const PostState({
    this.status = PostStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  PostState copyWith({
    PostStatus? status,
    List<PostEntity>? posts,
    String? errorMessage,
  }) => PostState(
    status: status ?? this.status,
    posts: posts ?? this.posts,
    errorMessage: errorMessage,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [status, posts, errorMessage];
}
