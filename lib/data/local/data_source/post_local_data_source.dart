import 'package:expense_tracker/data/local/dao/post_dao.dart';
import 'package:expense_tracker/data/local/models/posts_db_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostDbModel>> getPosts();
  Future<void> cachePosts(List<PostDbModel> posts);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final PostDao dao;

  PostLocalDataSourceImpl(this.dao);

  @override
  Future<List<PostDbModel>> getPosts() => dao.getPosts();

  @override
  Future<void> cachePosts(List<PostDbModel> posts) {
    return dao.insertPosts(posts);
  }
}
