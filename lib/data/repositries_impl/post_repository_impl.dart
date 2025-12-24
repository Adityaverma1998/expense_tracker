// lib/data/remote/repositories/post_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:expense_tracker/data/remote/apis/post_api_service.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApiService postApiService;

  PostRepositoryImpl({required this.postApiService});

  @override
  Future<Either<String, List<PostEntity>>> fetchPosts() async {
    // Fetch posts from API (returns Either<String, List<PostModel>>)
    final eitherResult = await postApiService.fetchPosts();

    // Map PostModel -> PostEntity using fold
    return eitherResult.fold(
      // Left case (error)
          (error) => Left(error),

      // Right case (success)
          (postModels) {
        final postEntities = postModels.map((post) => post.toEntity()).toList();
        return Right(postEntities);
      },
    );
  }
}
