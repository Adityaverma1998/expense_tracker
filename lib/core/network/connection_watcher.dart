import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class ConnectionWatcher {
  Stream<bool> get onStatusChange;
}

class ConnectionWatcherImpl implements ConnectionWatcher {
  final InternetConnection connection;

  ConnectionWatcherImpl(this.connection);

  @override
  Stream<bool> get onStatusChange {
    return connection.onStatusChange.map(
      (status) => status == InternetStatus.connected,
    );
  }
}
