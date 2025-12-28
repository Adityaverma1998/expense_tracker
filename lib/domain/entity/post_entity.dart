class PostEntity {
  final int id;
  final String? title;
  final String? body;
  final int? userId;

  const PostEntity({required this.id, this.title, this.body, this.userId});
}
