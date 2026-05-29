import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart' hide Profile;
import '../../../../core/error/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.database);

  final AppDatabase database;

  @override
  Future<Either<Failure, Profile>> getMyProfile() async {
    try {
      final myProfile = await (database.select(
        database.profiles,
      )..where((t) => t.isMe.equals(true))).getSingleOrNull();

      if (myProfile != null) {
        return Right(
          Profile(
            id: myProfile.peerId,
            username: myProfile.username,
            bio: myProfile.bio,
            photoPath: myProfile.photoPath,
            publicKey: myProfile.publicKey,
            topics: myProfile.topics,
            isMe: myProfile.isMe,
          ),
        );
      } else {
        return const Left(CacheFailure('My profile not found'));
      }
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveProfile(Profile profile) async {
    try {
      await database
          .into(database.profiles)
          .insertOnConflictUpdate(
            ProfilesCompanion(
              peerId: Value(profile.id),
              username: Value(profile.username),
              bio: Value(profile.bio),
              photoPath: Value(profile.photoPath),
              publicKey: Value(profile.publicKey),
              topics: Value(profile.topics),
              isMe: Value(profile.isMe),
            ),
          );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Profile>>> getNearbyPeers() async {
    try {
      final peers = await (database.select(
        database.profiles,
      )..where((t) => t.isMe.equals(false))).get();

      return Right(
        peers
            .map(
              (p) => Profile(
                id: p.peerId,
                username: p.username,
                bio: p.bio,
                photoPath: p.photoPath,
                publicKey: p.publicKey,
                topics: p.topics,
                isMe: p.isMe,
              ),
            )
            .toList(),
      );
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePeer(Profile peer) async {
    try {
      await database
          .into(database.profiles)
          .insertOnConflictUpdate(
            ProfilesCompanion(
              peerId: Value(peer.id),
              username: Value(peer.username),
              bio: Value(peer.bio),
              photoPath: Value(peer.photoPath),
              publicKey: Value(peer.publicKey),
              topics: Value(peer.topics),
              isMe: const Value(false),
            ),
          );
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
