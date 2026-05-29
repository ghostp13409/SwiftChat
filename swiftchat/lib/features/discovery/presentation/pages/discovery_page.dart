import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiftchat/core/di/service_locator.dart';
import 'package:swiftchat/core/utils/permission_service.dart';
import 'package:swiftchat/features/chat/presentation/pages/chat_page.dart';
import 'package:swiftchat/features/discovery/presentation/bloc/discovery_cubit.dart';
import 'package:swiftchat/features/discovery/domain/entities/peer.dart';
import 'package:swiftchat/features/profile/domain/entities/profile.dart';
import 'package:swiftchat/shared/widgets/swift_button.dart';
import 'package:swiftchat/shared/widgets/swift_card.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key, required this.myProfile});
  final Profile myProfile;

  Future<void> _handleStartDiscovery(BuildContext context) async {
    final hasPermissions =
        await sl<PermissionService>().checkAndRequestPermissions();
    if (hasPermissions) {
      if (context.mounted) {
        context.read<DiscoveryCubit>().startAll(
              myProfile.username,
              myProfile.id,
            );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Bluetooth and Location permissions are required for P2P.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SWIFTCHAT',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<DiscoveryCubit, DiscoveryState>(
            builder: (context, state) {
              var isRunning = false;
              if (state is DiscoveryRunning) {
                isRunning = state.isAdvertising || state.isDiscovering;
              }
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SwiftButton(
                  onPressed: () {
                    if (isRunning) {
                      context.read<DiscoveryCubit>().stopAll();
                    } else {
                      _handleStartDiscovery(context);
                    }
                  },
                  type: SwiftButtonType.icon,
                  icon: isRunning ? Icons.stop : Icons.play_arrow,
                  fullWidth: false,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DiscoveryCubit, DiscoveryState>(
        builder: (context, state) {
          if (state is DiscoveryInitial) {
            return _buildInitialState(context);
          }

          if (state is DiscoveryRunning) {
            return _buildRunningState(context, state);
          }

          if (state is DiscoveryError) {
            return Center(
              child: Text(
                'ERROR: ${state.message.toUpperCase()}',
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.radar, size: 80, color: Colors.black26),
          const SizedBox(height: 32),
          Text(
            'START DISCOVERY TO SEE NEARBY USERS',
            textAlign: MainCenter,
            style: GoogleFonts.oswald(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.black26,
            ),
          ),
          const SizedBox(height: 48),
          SwiftButton(
            onPressed: () => _handleStartDiscovery(context),
            label: 'START SCANNING',
          ),
        ],
      ),
    );
  }

  Widget _buildRunningState(BuildContext context, DiscoveryRunning state) {
    if (state.peers.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: 6),
            SizedBox(height: 32),
            Text(
              'SEARCHING FOR PEERS...',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.0),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.peers.length,
      itemBuilder: (context, index) {
        final peer = state.peers[index];
        final bool isConnected = peer.status == ConnectionStatus.connected;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: GestureDetector(
            onTap: isConnected
                ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(peer: peer),
                      ),
                    )
                : null,
            child: SwiftCard(
              shadowColor: isConnected ? const Color(0xFF00D26A) : null,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isConnected ? const Color(0xFF00D26A) : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        peer.userName?[0].toUpperCase() ?? '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          peer.userName?.toUpperCase() ?? 'UNKNOWN DEVICE',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          peer.status.name.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            letterSpacing: 1.0,
                            color: isConnected ? const Color(0xFF00D26A) : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildAction(context, peer),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAction(BuildContext context, Peer peer) {
    if (peer.status == ConnectionStatus.discovered) {
      return SwiftButton(
        onPressed: () =>
            context.read<DiscoveryCubit>().connect(peer.endpointId),
        label: 'CONNECT',
        fullWidth: false,
      );
    }
    if (peer.status == ConnectionStatus.connecting) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 3),
      );
    }
    if (peer.status == ConnectionStatus.connected) {
      return const Icon(Icons.chevron_right, size: 32);
    }
    return const SizedBox();
  }
}

const MainCenter = TextAlign.center;
