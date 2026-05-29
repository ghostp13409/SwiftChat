import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/profile.dart';
import '../../../../shared/widgets/swift_card.dart';

class ProfilePane extends StatelessWidget {
  const ProfilePane({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: theme.colorScheme.surface,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PROFILE',
                style: GoogleFonts.oswald(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: theme.brightness == Brightness.light ? Colors.black : Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: theme.brightness == Brightness.light ? Colors.black : Colors.white24,
                            offset: const Offset(6, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          profile.username.isNotEmpty ? profile.username[0].toUpperCase() : '?',
                          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      profile.username.toUpperCase(),
                      style: GoogleFonts.oswald(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              SwiftCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BIO',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1.0),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.bio ?? 'No bio provided.',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              const Text(
                'MY TOPICS',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 1.0),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: profile.topics.map((topic) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border.all(color: theme.brightness == Brightness.light ? Colors.black : Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      topic.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
