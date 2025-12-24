import 'package:dartz/dartz.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';
import 'package:expense_tracker/core/domain/usecase/use_case.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';

/// --- UseCase class ---
class FetchPostsUseCase
    extends UseCase<Either<String, List<PostEntity>>, void> {
  final PostRepository _postRepository;

  FetchPostsUseCase(this._postRepository);

  @override
  Future<Either<String, List<PostEntity>>> call({
     void params,
  }) async {
    // You can pass params.userId to repository if needed
    return await _postRepository.fetchPosts();
  }
}
