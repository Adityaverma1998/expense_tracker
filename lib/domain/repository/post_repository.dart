// lib/domain/repositories/post_repository.dart

import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/network/error.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> fetchPosts();
}
