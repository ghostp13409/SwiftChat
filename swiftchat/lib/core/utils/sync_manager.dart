import 'dart:async';
import 'dart:developer' as developer;
import '../../features/discovery/presentation/bloc/discovery_cubit.dart';
import '../../features/profile/presentation/bloc/profile_cubit.dart';
import '../../features/profile/presentation/bloc/profile_state.dart';

class SyncManager {
  SyncManager({
    required this.discoveryCubit,
    required this.profileCubit,
  });

  final DiscoveryCubit discoveryCubit;
  final ProfileCubit profileCubit;

  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) {
      _runSync();
    });
    // Initial run after a short delay to allow profile to load if needed
    Future.delayed(const Duration(seconds: 5), () => _runSync());
    developer.log('SyncManager started', name: 'SyncManager');
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    developer.log('SyncManager stopped', name: 'SyncManager');
  }

  Future<void> _runSync() async {
    try {
      final state = profileCubit.state;
      if (state is ProfileLoaded) {
        developer.log('Starting scheduled sync discovery', name: 'SyncManager');
        await discoveryCubit.startAll(
          state.profile.username,
          state.profile.id,
        );
        
        // Run for 60 seconds then stop
        await Future.delayed(const Duration(seconds: 60));
        await discoveryCubit.stopAll();
        developer.log('Scheduled sync discovery completed', name: 'SyncManager');
      } else {
        developer.log('Sync skipped: Profile not loaded', name: 'SyncManager');
      }
    } catch (e, stackTrace) {
      developer.log(
        'Sync run failed',
        name: 'SyncManager',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
