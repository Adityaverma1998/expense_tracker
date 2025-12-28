import 'package:dio/dio.dart';
import 'package:expense_tracker/core/network/error.dart';

class DioFailureMapper {
  static Failure map(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const CancelFailure();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure();

      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        final message =
            error.response?.data['message']?.toString() ??
            'Invalid server response';
        return ServerFailure(message);

      default:
        return const UnknownFailure();
    }
  }
}
