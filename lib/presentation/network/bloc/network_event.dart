part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartNetworkWatcher extends NetworkEvent {}

class _NetworkStatusChanged extends NetworkEvent {
  final bool isConnected;
  _NetworkStatusChanged(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}
