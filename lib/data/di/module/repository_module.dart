import 'package:expense_tracker/core/network/network_info.dart';
import 'package:expense_tracker/data/local/dao/post_dao.dart';
import 'package:expense_tracker/data/local/data_source/post_local_data_source.dart';
import 'package:expense_tracker/data/remote/data_source%20/post_remote_data_source.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';
import 'package:expense_tracker/data/repositries_impl/post_repository_impl.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:expense_tracker/domain/repository/post_repository.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // Remote DataSource
    getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(getIt<DioClient>()),
    );

    // Local DataSource
    getIt.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(getIt<PostDao>()),
    );

    // Repository
    getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        networkInfo: getIt<NetworkInfo>(),
        remote: getIt<PostRemoteDataSource>(),
        local: getIt<PostLocalDataSource>(),
      ),
    );
  }
}
