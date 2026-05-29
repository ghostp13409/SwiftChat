import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart' as di;
import 'core/database/migration_service.dart';
import 'features/profile/presentation/bloc/profile_cubit.dart';
import 'features/profile/presentation/bloc/profile_state.dart';
import 'features/profile/presentation/pages/profile_setup_page.dart';
import 'features/discovery/presentation/bloc/discovery_cubit.dart';
import 'features/chat/presentation/bloc/chat_cubit.dart';

import 'features/discovery/presentation/pages/discovery_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  // Data Migration (Drift to Isar)
  final migrationService = di.sl<MigrationService>();
  await migrationService.migrate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ProfileCubit>()..loadProfile()),
        BlocProvider(create: (_) => di.sl<DiscoveryCubit>()..init()),
        BlocProvider(create: (_) => di.sl<ChatCubit>()..init()),
      ],
      child: MaterialApp(
        title: 'SwiftChat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6750A4),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6750A4),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const AppRoot(),
      ),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading || state is ProfileInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProfileLoaded) {
          return DiscoveryPage(myProfile: state.profile);
        }

        if (state is ProfileNotFound) {
          return const ProfileSetupPage();
        }

        if (state is ProfileError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<ProfileCubit>().loadProfile(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
