import 'package:expense_tracker/data/local/models/posts_db_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class PostDao {
  @Query('SELECT * FROM posts')
  Future<List<PostDbModel>> getPosts();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPosts(List<PostDbModel> posts);

  @Query('DELETE FROM posts')
  Future<void> clearPosts();
}
