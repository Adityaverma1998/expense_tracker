import 'package:dio/dio.dart';
import 'package:expense_tracker/core/network/connection_watcher.dart';
import 'package:expense_tracker/core/network/network_info.dart';
import 'package:expense_tracker/data/remote/network/constants/network_constants.dart';
import 'package:expense_tracker/data/remote/network/dio/configs/dio_configs.dart';
import 'package:expense_tracker/data/remote/network/dio/dio_client.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/auth_interceptor.dart';
import 'package:expense_tracker/data/remote/network/dio/interceptors/logging_interceptor.dart';
import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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

    getIt.registerLazySingleton<InternetConnection>(
      () => InternetConnection.createInstance(
        customCheckOptions: [
          InternetCheckOption(uri: Uri.parse('https://example.com')),
        ],
      ),
    );

    getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<InternetConnection>()),
    );

    getIt.registerLazySingleton<ConnectionWatcher>(
      () => ConnectionWatcherImpl(getIt<InternetConnection>()),
    );

    getIt.registerSingleton<DioClient>(dioClient);
    getIt.registerSingleton<Dio>(dioClient.dio);
  }
}
