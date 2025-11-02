import 'package:dio/dio.dart';
import 'configs/dio_configs.dart';

class DioClient {
  final Dio _dio;

  DioClient({required DioConfigs configs})
      : _dio = Dio(
    BaseOptions(
      baseUrl: configs.baseUrl,
      connectTimeout: Duration(milliseconds: configs.connectionTimeout),
      receiveTimeout: Duration(milliseconds: configs.receiveTimeout),
      contentType: Headers.jsonContentType,
    ),
  );

  Dio get dio => _dio;

  // Add custom interceptors dynamically
  Dio addInterceptors(List<Interceptor> interceptors) {
    _dio.interceptors.addAll(interceptors);
    return _dio;
  }
}
