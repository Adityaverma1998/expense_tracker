// lib/data/remote/model/post_model.dart

class PostApiModel {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostApiModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostApiModel.fromJson(Map<String, dynamic> json) {
    return PostApiModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
