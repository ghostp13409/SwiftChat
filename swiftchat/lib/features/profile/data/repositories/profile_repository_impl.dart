import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import '../../../../core/database/collections/profile_collection.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.isar);

  final Isar isar;

  @override
  Future<Either<Failure, Profile>> getMyProfile() async {
    try {
      final myProfile = await isar.profileCollections
          .filter()
          .isMeEqualTo(true)
          .findFirst();

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
      await isar.writeTxn(() async {
        final collection = isar.profileCollections;
        final existing = await collection
            .filter()
            .peerIdEqualTo(profile.id)
            .findFirst();

        final record = ProfileCollection()
          ..peerId = profile.id
          ..username = profile.username
          ..bio = profile.bio
          ..photoPath = profile.photoPath
          ..publicKey = profile.publicKey
          ..topics = profile.topics
          ..isMe = profile.isMe;

        if (existing != null) {
          record.id = existing.id;
        }

        await collection.put(record);
      });
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Profile>>> getNearbyPeers() async {
    try {
      final peers = await isar.profileCollections
          .filter()
          .isMeEqualTo(false)
          .findAll();

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
      await isar.writeTxn(() async {
        final collection = isar.profileCollections;
        final existing = await collection
            .filter()
            .peerIdEqualTo(peer.id)
            .findFirst();

        final record = ProfileCollection()
          ..peerId = peer.id
          ..username = peer.username
          ..bio = peer.bio
          ..photoPath = peer.photoPath
          ..publicKey = peer.publicKey
          ..topics = peer.topics
          ..isMe = false;

        if (existing != null) {
          record.id = existing.id;
        }

        await collection.put(record);
      });
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
