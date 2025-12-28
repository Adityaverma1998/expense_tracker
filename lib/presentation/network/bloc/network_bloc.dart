import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/network/connection_watcher.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final ConnectionWatcher watcher;
  StreamSubscription? _subscription;

  NetworkBloc(this.watcher) : super(const NetworkState.connected()) {
    on<StartNetworkWatcher>(_onStart);
    on<_NetworkStatusChanged>(_onChanged);
  }

  void _onStart(StartNetworkWatcher event, Emitter<NetworkState> emit) {
    _subscription ??= watcher.onStatusChange.listen((isConnected) {
      add(_NetworkStatusChanged(isConnected));
    });
  }

  void _onChanged(_NetworkStatusChanged event, Emitter<NetworkState> emit) {
    emit(
      event.isConnected
          ? const NetworkState.connected()
          : const NetworkState.disconnected(),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
