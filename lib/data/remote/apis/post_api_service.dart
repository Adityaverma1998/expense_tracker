import 'package:dartz/dartz.dart';
import 'package:expense_tracker/data/remote/model/postModel.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';

class PostApiService {
  // Implementation of PostApiService
  final DioClient dioClient;

  PostApiService(this.dioClient);

  // Use Right for success, Left for error
  Future<Either<String, List<PostModel>>> fetchPosts() async {
    try {
      final response = await dioClient.dio.get('/posts');
      final List<PostModel> posts = (response.data as List)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
      return Right(posts); // Success is in Right
    } catch (e) {
      return Left(e.toString()); // Error is in Left
    }
  }
}
