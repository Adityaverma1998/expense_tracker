import 'dart:async';

import 'package:dio/dio.dart';

typedef RetryEvaluator = FutureOr<bool> Function(DioError error);

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final RetryOptions options;

  RetryInterceptor({required this.dio, this.options = const RetryOptions()});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final extra = RetryOptions.fromExtra(err.requestOptions, options);
    final shouldRetry = extra.retries > 0 && await extra.retryEvaluator(err);

    if (!shouldRetry) return handler.next(err);

    await Future.delayed(extra.retryInterval);
    final newOptions = err.requestOptions.toOptions();

    try {
      final response = await dio.request(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        options: newOptions,
      );
      handler.resolve(response);
    } catch (e) {
      handler.next(err);
    }
  }
}

class RetryOptions {
  final int retries;
  final Duration retryInterval;
  final RetryEvaluator retryEvaluator;

  const RetryOptions({
    this.retries = 3,
    this.retryInterval = const Duration(seconds: 1),
    this.retryEvaluator = defaultRetryEvaluator,
  });

  static FutureOr<bool> defaultRetryEvaluator(DioException error) =>
      error.type != DioExceptionType.cancel &&
      error.type != DioExceptionType.badResponse;

  static const extraKey = 'cache_retry_request';

  static RetryOptions fromExtra(
    RequestOptions request,
    RetryOptions defaults,
  ) => request.extra[extraKey] ?? defaults;
}

extension RequestOptionsExt on RequestOptions {
  Options toOptions() => Options(
    method: method,
    headers: headers,
    responseType: responseType,
    contentType: contentType,
    extra: extra,
  );
}
