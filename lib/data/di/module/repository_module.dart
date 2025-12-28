import 'package:expense_tracker/data/remote/apis/post_api_service.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final response = await apiService.fetchPosts();
    return response.map((e) => e.toEntity()).toList();
  }
}
