import 'package:dio/dio.dart';

enum LogLevel { none, basic, headers, body }

class LoggingInterceptor extends Interceptor {
  final LogLevel level;
  final void Function(Object object) logPrint;

  LoggingInterceptor({this.level = LogLevel.body, this.logPrint = print});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (level == LogLevel.none) return handler.next(options);
    logPrint('--> ${options.method} ${options.uri}');
    if (level.index >= LogLevel.headers.index) {
      options.headers.forEach((k, v) => logPrint('$k: $v'));
    }
    if (level == LogLevel.body && options.data != null) logPrint(options.data);
    logPrint('--> END ${options.method}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (level == LogLevel.none) return handler.next(response);
    logPrint('<-- ${response.statusCode} ${response.requestOptions.uri}');
    if (level == LogLevel.body && response.data != null) {
      logPrint(response.data);
    }
    logPrint('<-- END HTTP');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint('[DIO ERROR] ${err.response}');
    handler.next(err);
  }
}
