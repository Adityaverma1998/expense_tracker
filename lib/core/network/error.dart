abstract class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure()
    : super("Network error. Please check your connection.");
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super("Connection timeout with server.");
}

class ServerFailure extends Failure {
  const ServerFailure([String message = "Server error"]) : super(message);
}

class CancelFailure extends Failure {
  const CancelFailure() : super("Request was cancelled.");
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super("Unexpected error occurred.");
}
