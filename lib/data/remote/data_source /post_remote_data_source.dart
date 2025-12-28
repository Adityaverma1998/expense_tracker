import 'package:expense_tracker/core/constants/api_endpoints.dart';
import 'package:expense_tracker/data/remote/model/postModel.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';

abstract class PostRemoteDataSource {
  Future<List<PostApiModel>> fetchPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final DioClient dioClient;

  PostRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<PostApiModel>> fetchPosts() async {
    final response = await dioClient.dio.get(ApiEndpoints.getPosts);
    return (response.data as List)
        .map((e) => PostApiModel.fromJson(e))
        .toList();
  }
}
