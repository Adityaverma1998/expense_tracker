// import 'package:dio/dio.dart';
// import 'package:expense_tracker/data/remote/data_source%20/post_remote_data_source.dart';
// import 'package:expense_tracker/data/remote/network/dio/configs/dio_configs.dart';
// import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';
// import 'package:expense_tracker/data/remote/network/dio/interceptors/auth_interceptor.dart';
// import 'package:expense_tracker/data/remote/network/dio/interceptors/logging_interceptor.dart';
// import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
// import 'package:expense_tracker/di/serivce_locator.dart';
//
// mixin RemoteModule {
//   static Future<void> configureRemoteModuleInjection() async {
//     // Dio Config
//     const dioConfig = DioConfigs(
//       baseUrl: 'https://api.example.com',
//       connectionTimeout: 15000,
//       receiveTimeout: 15000,
//     );
//
//     // Dio Client
//     final dioClient = DioClient(configs: dioConfig);
//
//     // Interceptors
//     dioClient.addInterceptors([
//       LoggingInterceptor(),
//       AuthInterceptor(
//         accessToken: () async => await SharedPrefHelper.authToken,
//         // loginStatus: () async => await getIt<SharedPrefHelper>().isLoggedIn,
//         sharedPrefs: getIt<SharedPrefHelper>(),
//       ),
//     ]);
//
//     getIt.registerSingleton<DioClient>(dioClient);
//     getIt.registerSingleton<Dio>(dioClient.dio);
//
//     // api's:-------------------------------------------------------------------
//     // Register PostApiService with injected DioClient
//     getIt.registerSingleton<PostRemoteDataSource>(
//       PostRemoteDataSource(getIt<DioClient>()),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:expense_tracker/data/remote/network/constants/network_constants.dart';
import 'package:expense_tracker/data/remote/network/dio/configs/dio_configs.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/auth_interceptor.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/logging_interceptor.dart';
import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
import 'package:expense_tracker/di/serivce_locator.dart';

mixin RemoteModule {
  static Future<void> configureRemoteModuleInjection() async {
    const dioConfig = DioConfigs(
      baseUrl: NetworkConstants.baseUrl,
      connectionTimeout: 15000,
      receiveTimeout: 15000,
    );

    final dioClient = DioClient(configs: dioConfig);

    dioClient.addInterceptors([
      LoggingInterceptor(),
      AuthInterceptor(
        accessToken: () async => SharedPrefHelper.authToken,
        sharedPrefs: getIt<SharedPrefHelper>(),
      ),
    ]);

    getIt.registerSingleton<DioClient>(dioClient);
    getIt.registerSingleton<Dio>(dioClient.dio);
  }
}
