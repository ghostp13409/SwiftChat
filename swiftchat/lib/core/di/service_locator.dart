import 'package:get_it/get_it.dart';
import '../database/app_database.dart';

import '../../core/utils/encryption_service.dart';
import '../../core/utils/permission_service.dart';
import '../../core/utils/key_service.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/chat/presentation/bloc/chat_cubit.dart';
import '../../features/discovery/data/data_sources/handshake_service.dart';
import '../../features/discovery/data/repositories/discovery_repository_impl.dart';
import '../../features/discovery/domain/repositories/discovery_repository.dart';
import '../../features/discovery/domain/use_cases/discovery_use_cases.dart';
import '../../features/discovery/presentation/bloc/discovery_cubit.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/use_cases/get_profile.dart';
import '../../features/profile/domain/use_cases/save_profile.dart';
import '../../features/profile/presentation/bloc/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Discovery
  // Cubit
  sl.registerFactory(
    () => DiscoveryCubit(
      startAdvertising: sl(),
      stopAdvertising: sl(),
      startDiscovery: sl(),
      stopDiscovery: sl(),
      requestConnection: sl(),
      repository: sl(),
      handshakeService: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => StartAdvertising(sl()));
  sl.registerLazySingleton(() => StopAdvertising(sl()));
  sl.registerLazySingleton(() => StartDiscovery(sl()));
  sl.registerLazySingleton(() => StopDiscovery(sl()));
  sl.registerLazySingleton(() => RequestConnection(sl()));

  // Repositories
  sl.registerLazySingleton<DiscoveryRepository>(
    () => DiscoveryRepositoryImpl(),
  );

  sl.registerLazySingleton(
    () => HandshakeService(
      discoveryRepository: sl(),
      keyService: sl(),
      encryptionService: sl(),
    ),
  );

  // Features - Profile
  // Cubit
  sl.registerFactory(
    () => ProfileCubit(
      getProfile: sl(),
      saveProfile: sl(),
      keyService: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => SaveProfile(sl()));

  // Repositories
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );

  // Features - Chat
  // Cubit
  sl.registerFactory(
    () => ChatCubit(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      discoveryRepository: sl(),
      handshakeService: sl(),
      encryptionService: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => KeyService());
  sl.registerLazySingleton(() => PermissionService());
  sl.registerLazySingleton(() => EncryptionService());
}
