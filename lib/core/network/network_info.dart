import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection checker;

  NetworkInfoImpl(this.checker);

  @override
  Future<bool> get isConnected async {
    return await checker.hasInternetAccess;
  }
}
