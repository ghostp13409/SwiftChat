import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../../core/utils/key_service.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/get_profile.dart';
import '../../domain/use_cases/save_profile.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.getProfile,
    required this.saveProfile,
    required this.keyService,
  }) : super(ProfileInitial());

  final GetProfile getProfile;
  final SaveProfile saveProfile;
  final KeyService keyService;

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    final result = await getProfile(NoParams());
    result.fold((failure) {
      if (failure.message.contains('not found')) {
        emit(ProfileNotFound());
      } else {
        emit(ProfileError(failure.message));
      }
    }, (profile) => emit(ProfileLoaded(profile)));
  }

  Future<void> createProfile({
    required String username,
    String? bio,
    List<String> topics = const [],
  }) async {
    emit(ProfileLoading());

    try {
      // Generate secure identity
      final keyPair = await keyService.generateIdentityKeyPair();
      final id = const Uuid().v4();

      final newProfile = Profile(
        id: id,
        username: username,
        bio: bio,
        publicKey: keyPair.publicKey,
        topics: topics,
        isMe: true,
      );

      final result = await saveProfile(newProfile);
      result.fold(
        (failure) => emit(ProfileError(failure.message)),
        (_) => emit(ProfileLoaded(newProfile)),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
