import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:expense_tracker/core/network/dio_failure_mapper.dart';
import 'package:expense_tracker/core/network/error.dart';
import 'package:expense_tracker/data/local/data_source/post_local_data_source.dart';
import 'package:expense_tracker/data/mapper/post_mapper.dart';
import 'package:expense_tracker/data/remote/data_source%20/post_remote_data_source.dart';
import 'package:expense_tracker/domain/entity/post_entity.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remote;
  final PostLocalDataSource local;

  PostRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<PostEntity>>> fetchPosts() async {
    try {
      final remotePosts = await remote.fetchPosts();

      await local.cachePosts(remotePosts.map((e) => e.toDbModel()).toList());

      return Right(remotePosts.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(DioFailureMapper.map(e));
    }
  }
}
