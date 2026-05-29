import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../features/discovery/presentation/bloc/discovery_cubit.dart';
import '../../../features/discovery/domain/entities/peer.dart';
import '../../../features/profile/domain/entities/profile.dart';
import '../widgets/swift_button.dart';
import '../widgets/swift_card.dart';

class RadarOverlay extends StatefulWidget {
  const RadarOverlay({super.key, required this.myProfile});
  final Profile myProfile;

  @override
  State<RadarOverlay> createState() => _RadarOverlayState();
}

class _RadarOverlayState extends State<RadarOverlay> {
  bool _isEveryone = true;

  @override
  void initState() {
    super.initState();
    // Auto-start discovery when Radar is opened
    context.read<DiscoveryCubit>().startAll(
          widget.myProfile.username,
          widget.myProfile.id,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light ? Colors.white : const Color(0xFF0B0E14),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(top: BorderSide(color: theme.brightness == Brightness.light ? Colors.black : Colors.white, width: 3)),
      ),
      child: Column(
        children: [
          // Drag Handle & Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.light ? Colors.black12 : Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RADAR',
                      style: GoogleFonts.oswald(
                        color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.0,
                      ),
                    ),
                    
                    // Privacy Toggle
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.light ? const Color(0xFFF0F0F0) : const Color(0xFF1C1F26),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: theme.brightness == Brightness.light ? Colors.black12 : Colors.white24),
                      ),
                      child: Row(
                        children: [
                          _buildToggleButton('EVERYONE', _isEveryone, theme),
                          _buildToggleButton('CONTACTS ONLY', !_isEveryone, theme),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Main Discovery Area
          Expanded(
            child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
              builder: (context, state) {
                if (state is DiscoveryRunning) {
                  if (state.peers.isEmpty) {
                    return _buildScanningState();
                  }

                  return _buildPeerList(state.peers, theme);
                }
                
                if (state is DiscoveryError) {
                  return Center(
                    child: Text(
                      'ERROR: ${state.message.toUpperCase()}',
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SwiftButton(
              onPressed: () => Navigator.pop(context),
              label: 'CLOSE',
              type: SwiftButtonType.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, ThemeData theme) {
    return GestureDetector(
      onTap: () => setState(() => _isEveryone = label == 'EVERYONE'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00D26A) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : (theme.brightness == Brightness.light ? Colors.black54 : Colors.white54),
            fontSize: 10,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildScanningState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RadarPulseAnimation(),
        const SizedBox(height: 32),
        Text(
          'SEARCHING FOR TRAVELERS...',
          style: GoogleFonts.oswald(
            color: const Color(0xFF00D26A),
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildPeerList(List<Peer> peers, ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: peers.length,
      itemBuilder: (context, index) {
        final peer = peers[index];
        final bool isConnected = peer.status == ConnectionStatus.connected;
        
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SwiftCard(
            shadowColor: isConnected ? const Color(0xFF00D26A) : (theme.brightness == Brightness.light ? Colors.black12 : Colors.white24),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF00D26A),
                  child: Text(peer.userName?[0].toUpperCase() ?? '?', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        peer.userName?.toUpperCase() ?? 'UNKNOWN DEVICE',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        peer.status.name.toUpperCase(),
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: theme.brightness == Brightness.light ? Colors.black54 : Colors.white54),
                      ),
                    ],
                  ),
                ),
                if (peer.status == ConnectionStatus.discovered)
                  SwiftButton(
                    onPressed: () => context.read<DiscoveryCubit>().connect(peer.endpointId),
                    label: 'HI',
                    fullWidth: false,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RadarPulseAnimation extends StatefulWidget {
  const RadarPulseAnimation({super.key});

  @override
  State<RadarPulseAnimation> createState() => _RadarPulseAnimationState();
}

class _RadarPulseAnimationState extends State<RadarPulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF00D26A).withOpacity(1 - _controller.value),
              width: 4 * _controller.value,
            ),
          ),
          child: Center(
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Color(0xFF00D26A), blurRadius: 10, spreadRadius: 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
