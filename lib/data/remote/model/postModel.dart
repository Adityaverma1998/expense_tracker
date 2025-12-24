// lib/data/remote/model/post_model.dart

import 'package:expense_tracker/domain/entity/post_entity.dart';

class PostModel {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final int likes;
  final int dislikes;
  final int views;
  final int userId;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.likes,
    required this.dislikes,
    required this.views,
    required this.userId,
  });

  // Factory method to create a PostModel from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags'] ?? []),  // Assuming tags are in a list
      likes: json['reactions']['likes'] ?? 0,  // Assuming likes are nested in 'reactions'
      dislikes: json['reactions']['dislikes'] ?? 0,  // Same for dislikes
      views: json['views'] ?? 0,
      userId: json['userId'] ?? 0,
    );
  }

  // Convert PostModel to PostEntity
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      title: title,
      body: body,
      tags: tags,
      likes: likes,
      dislikes: dislikes,
      views: views,
      userId: userId,
    );
  }

  // Convert PostModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'tags': tags,
      'reactions': {
        'likes': likes,
        'dislikes': dislikes,
      },
      'views': views,
      'userId': userId,
    };
  }
}

class ReactionModel {
  final int likes;
  final int dislikes;

  ReactionModel({
    required this.likes,
    required this.dislikes,
  });

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      likes: json['likes'],
      dislikes: json['dislikes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'dislikes': dislikes,
    };
  }
}
