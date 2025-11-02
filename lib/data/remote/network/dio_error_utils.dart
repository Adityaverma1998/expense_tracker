import 'package:dio/dio.dart';

class DioErrorUtil {
  static String handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionTimeout:
        return "Connection timeout with server.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout from server.";
      case DioExceptionType.badResponse:
        return error.response?.data['message'] ?? "Invalid response from server.";
      case DioExceptionType.sendTimeout:
        return "Send timeout in connection.";
      case DioExceptionType.connectionError:
        return "Network error. Please check your connection.";
      default:
        return "Unexpected error occurred.";
    }
  }
}
