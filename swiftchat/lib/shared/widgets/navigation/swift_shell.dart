import 'package:flutter/material.dart';
import '../../../features/profile/domain/entities/profile.dart';
import '../../../features/profile/presentation/pages/profile_pane.dart';
import '../../../features/discovery/presentation/pages/chat_list_pane.dart';
import '../../radar/radar_overlay.dart';

class SwiftShell extends StatefulWidget {
  const SwiftShell({super.key, required this.myProfile});
  final Profile myProfile;

  @override
  State<SwiftShell> createState() => _SwiftShellState();
}

class _SwiftShellState extends State<SwiftShell> {
  final PageController _pageController = PageController(initialPage: 1);
  double _currentPage = 1.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = _pageController.page ?? 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openRadar() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RadarOverlay(myProfile: widget.myProfile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              ProfilePane(profile: widget.myProfile),
              ChatListPane(onOpenRadar: _openRadar),
            ],
          ),
          
          // Custom Page Indicator (Minimal)
          if (_currentPage < 1.0)
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              left: 20,
              child: Opacity(
                opacity: 1.0 - _currentPage,
                child: const Icon(Icons.arrow_back_ios, color: Colors.black26),
              ),
            ),
        ],
      ),
    );
  }
}
