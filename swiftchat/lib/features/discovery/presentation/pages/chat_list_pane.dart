import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/discovery_cubit.dart';
import '../../domain/entities/peer.dart';
import '../../../chat/presentation/pages/chat_page.dart';
import '../../../../shared/widgets/swift_card.dart';
import '../../../../shared/widgets/swift_button.dart';

class ChatListPane extends StatelessWidget {
  const ChatListPane({super.key, required this.onOpenRadar});
  final VoidCallback onOpenRadar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'CHATS',
                    style: GoogleFonts.oswald(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
                    builder: (context, state) {
                      final connectedPeers = state is DiscoveryRunning
                          ? state.peers
                              .where((p) =>
                                  p.status == ConnectionStatus.connected)
                              .toList()
                          : <Peer>[];

                      if (connectedPeers.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '👋',
                                style: TextStyle(fontSize: 48),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'NO ACTIVE CHATS',
                                style: GoogleFonts.oswald(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: theme.brightness == Brightness.light ? Colors.black26 : Colors.white24,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Swipe up on the Radar to find someone!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: theme.brightness == Brightness.light ? Colors.black26 : Colors.white24),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: connectedPeers.length,
                        itemBuilder: (context, index) {
                          final peer = connectedPeers[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(peer: peer),
                                ),
                              ),
                              child: SwiftCard(
                                shadowColor: const Color(0xFF00D26A),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF00D26A),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: theme.brightness == Brightness.light ? Colors.black : Colors.white, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          peer.userName?[0].toUpperCase() ??
                                              '?',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            peer.userName?.toUpperCase() ??
                                                'UNKNOWN',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            'End-to-End Encrypted',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: theme.brightness == Brightness.light ? Colors.black54 : Colors.white70),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.chevron_right),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            
            // Floating Radar Trigger
            Positioned(
              bottom: 30,
              right: 24,
              child: SwiftButton(
                onPressed: onOpenRadar,
                type: SwiftButtonType.primary,
                fullWidth: false,
                icon: Icons.radar,
                label: 'RADAR',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
