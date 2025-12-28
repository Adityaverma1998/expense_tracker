import 'package:floor/floor.dart';

@Entity(tableName: 'posts')
class PostDbModel {
  @primaryKey
  final int id;
  final String title;
  final String body;
  final int userId;

  PostDbModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });
}
