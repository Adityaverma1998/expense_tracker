import 'package:expense_tracker/presentation/network/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineWrapper extends StatelessWidget {
  final Widget child;

  const OfflineWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (!state.isConnected) {
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Material(
                  elevation: 6,
                  color: Colors.red,
                  child: SafeArea(
                    bottom: false,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'No Internet Connection',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
