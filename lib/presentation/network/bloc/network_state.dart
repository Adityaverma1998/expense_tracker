part of 'network_bloc.dart';

class NetworkState extends Equatable {
  final bool isConnected;

  const NetworkState._(this.isConnected);

  const NetworkState.connected() : this._(true);
  const NetworkState.disconnected() : this._(false);

  @override
  List<Object?> get props => [isConnected];
}
