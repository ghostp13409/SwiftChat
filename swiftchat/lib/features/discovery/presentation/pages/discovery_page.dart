import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiftchat/core/di/service_locator.dart';
import 'package:swiftchat/core/utils/permission_service.dart';
import 'package:swiftchat/features/chat/presentation/pages/chat_page.dart';
import 'package:swiftchat/features/discovery/presentation/bloc/discovery_cubit.dart';
import 'package:swiftchat/features/discovery/domain/entities/peer.dart';
import 'package:swiftchat/features/profile/domain/entities/profile.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key, required this.myProfile});
  final Profile myProfile;

  Future<void> _handleStartDiscovery(BuildContext context) async {
    final hasPermissions = await sl<PermissionService>().checkAndRequestPermissions();
    if (hasPermissions) {
      if (context.mounted) {
        context.read<DiscoveryCubit>().startAll(myProfile.username, myProfile.id);
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bluetooth and Location permissions are required for P2P.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Discovery'),
        actions: [
          BlocBuilder<DiscoveryCubit, DiscoveryState>(
            builder: (context, state) {
              bool isRunning = false;
              if (state is DiscoveryRunning) {
                isRunning = state.isAdvertising || state.isDiscovering;
              }
              return IconButton(
                icon: Icon(isRunning ? Icons.stop : Icons.play_arrow),
                onPressed: () {
                  if (isRunning) {
                    context.read<DiscoveryCubit>().stopAll();
                  } else {
                    _handleStartDiscovery(context);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DiscoveryCubit, DiscoveryState>(
        builder: (context, state) {
          if (state is DiscoveryInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.radar, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Start discovery to see nearby users'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _handleStartDiscovery(context),
                    child: const Text('Start Discovery'),
                  ),
                ],
              ),
            );
          }

          if (state is DiscoveryRunning) {
            if (state.peers.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Searching for peers...'),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.peers.length,
              itemBuilder: (context, index) {
                final peer = state.peers[index];
                return ListTile(
                  onTap: peer.status == ConnectionStatus.connected
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(peer: peer),
                            ),
                          )
                      : null,
                  leading: CircleAvatar(
                    child: Text(peer.userName?[0].toUpperCase() ?? '?'),
                  ),
                  title: Text(peer.userName ?? 'Unknown Device'),
                  subtitle: Text('ID: ${peer.endpointId} • ${peer.status.name}'),
                  trailing: _buildTrailing(context, peer),
                );
              },
            );
          }

          if (state is DiscoveryError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTrailing(BuildContext context, Peer peer) {
    if (peer.status == ConnectionStatus.discovered) {
      return ElevatedButton(
        onPressed: () => context.read<DiscoveryCubit>().connect(peer.endpointId),
        child: const Text('Connect'),
      );
    }
    if (peer.status == ConnectionStatus.connecting) {
      return const CircularProgressIndicator();
    }
    if (peer.status == ConnectionStatus.connected) {
      return const Icon(Icons.check_circle, color: Colors.green);
    }
    return const SizedBox();
  }
}
