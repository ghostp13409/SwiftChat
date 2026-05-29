import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/widgets/swift_button.dart';
import '../../../../shared/widgets/swift_card.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();
  final List<String> _selectedTopics = [];
  final List<String> _availableTopics = [
    'Backpacking',
    'Photography',
    'Local Food',
    'Hiking',
    'Culture',
    'Music',
    'Tech',
    'Nature',
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().createProfile(
            username: _usernameController.text.trim(),
            bio: _bioController.text.trim(),
            topics: _selectedTopics,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'WELCOME TO',
                          style: GoogleFonts.oswald(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2.0,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          'SWIFTCHAT',
                          style: GoogleFonts.oswald(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                            color: theme.brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Create your offline identity to start connecting nearby.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.brightness == Brightness.light
                                ? Colors.black54
                                : Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 48),
                        SwiftCard(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                style: const TextStyle(fontWeight: FontWeight.w800),
                                decoration: const InputDecoration(
                                  labelText: 'USERNAME',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.0),
                                  hintText: 'e.g. wanderlust_jane',
                                  prefixIcon: Icon(Icons.person),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a username';
                                  }
                                  return null;
                                },
                              ),
                              const Divider(thickness: 2),
                              TextFormField(
                                controller: _bioController,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                                decoration: const InputDecoration(
                                  labelText: 'SHORT BIO (OPTIONAL)',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.0),
                                  hintText: 'Tell others about your journey...',
                                  prefixIcon: Icon(Icons.info),
                                  border: InputBorder.none,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'TOPICS OF INTEREST',
                          style: GoogleFonts.oswald(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: _availableTopics.map((topic) {
                            final isSelected = _selectedTopics.contains(topic);
                            return ChoiceChip(
                              label: Text(
                                topic.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: isSelected
                                      ? (theme.brightness == Brightness.light
                                          ? Colors.white
                                          : Colors.black)
                                      : (theme.brightness == Brightness.light
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                              selected: isSelected,
                              selectedColor: theme.colorScheme.primary,
                              backgroundColor: theme.colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: theme.brightness == Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                  width: 2,
                                ),
                              ),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedTopics.add(topic);
                                  } else {
                                    _selectedTopics.remove(topic);
                                  }
                                });
                                HapticFeedback.selectionClick();
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 48),
                        SwiftButton(
                          onPressed: _submit,
                          label: 'GET STARTED',
                        ),
                        const SizedBox(height: 32),
                        const Center(
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'OFFLINE ONLY • END-TO-END ENCRYPTED',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
