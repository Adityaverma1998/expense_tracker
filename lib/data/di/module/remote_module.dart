import 'package:expense_tracker/data/remote/network/dio/configs/dio_configs.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/auth_interceptor.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/logging_interceptor.dart';
import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:dio/dio.dart';


mixin RemoteModule {
  static Future<void> configureRemoteModuleInjection() async {
    // Dio Config
    const dioConfig = DioConfigs(
      baseUrl: 'https://api.example.com',
      connectionTimeout: 15000,
      receiveTimeout: 15000,
    );

    // Dio Client
    final dioClient = DioClient(configs: dioConfig);

    // Interceptors
    dioClient.addInterceptors([
      LoggingInterceptor(),
      AuthInterceptor(
        accessToken:() async => await SharedPrefHelper.authToken,
        // loginStatus: () async => await getIt<SharedPrefHelper>().isLoggedIn,
        sharedPrefs: getIt<SharedPrefHelper>(),
      ),

    ]);

    getIt.registerSingleton<DioClient>(dioClient);
    getIt.registerSingleton<Dio>(dioClient.dio);
  }
}
