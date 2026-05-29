import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftchat/core/database/app_database.dart' hide Profile;
import 'package:swiftchat/core/error/failures.dart';
import 'package:swiftchat/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:swiftchat/features/profile/domain/entities/profile.dart';

void main() {
  late AppDatabase database;
  late ProfileRepositoryImpl repository;

  setUp(() {
    // Use an in-memory database for testing
    database = AppDatabase.withExecutor(NativeDatabase.memory());
    repository = ProfileRepositoryImpl(database);
  });

  tearDown(() async {
    await database.close();
  });

  const tProfile = Profile(
    id: 'user-123',
    username: 'test_user',
    bio: 'hello world',
    publicKey: 'pk-123',
    isMe: true,
  );

  group('ProfileRepositoryImpl', () {
    test('should save and retrieve my profile', () async {
      // Act
      await repository.saveProfile(tProfile);
      final result = await repository.getMyProfile();

      // Assert
      expect(result, const Right(tProfile));
    });

    test('should return CacheFailure when my profile is not found', () async {
      // Act
      final result = await repository.getMyProfile();

      // Assert
      expect(result, const Left(CacheFailure('My profile not found')));
    });

    test('should save and retrieve nearby peers', () async {
      // Arrange
      const tPeer = Profile(
        id: 'peer-456',
        username: 'peer_user',
        publicKey: 'pk-456',
        isMe: false,
      );

      // Act
      await repository.savePeer(tPeer);
      final result = await repository.getNearbyPeers();

      // Assert
      expect(result.isRight(), isTrue);
      result.fold((l) => fail('Should have returned a Right'), (r) {
        expect(r, contains(tPeer));
        expect(r.length, 1);
      });
    });
  });
}

// Add a testing constructor to AppDatabase
extension AppDatabaseTesting on AppDatabase {
  static AppDatabase forTesting(QueryExecutor executor) {
    return AppDatabase.withExecutor(executor);
  }
}
