import 'dart:developer' as developer;
import 'package:isar_community/isar.dart';
import 'app_database.dart';
import 'collections/profile_collection.dart';

class MigrationService {
  MigrationService(this.driftDb, this.isar);

  final AppDatabase driftDb;
  final Isar isar;

  Future<void> migrate() async {
    try {
      developer.log(
        'Starting Data Migration (Drift to Isar)...',
        name: 'MigrationService',
      );
      final profiles = await driftDb.select(driftDb.profiles).get();
      if (profiles.isEmpty) {
        developer.log(
          'No Drift profiles found. Skipping migration.',
          name: 'MigrationService',
        );
        return;
      }

      developer.log(
        'Found ${profiles.length} profiles in Drift. Migrating to Isar...',
        name: 'MigrationService',
      );

      await isar.writeTxn(() async {
        for (final p in profiles) {
          // Check if already exists to avoid duplicates
          final existing = await isar.profileCollections
              .filter()
              .peerIdEqualTo(p.peerId)
              .findFirst();
          if (existing == null) {
            final collection = ProfileCollection()
              ..peerId = p.peerId
              ..username = p.username
              ..bio = p.bio
              ..photoPath = p.photoPath
              ..publicKey = p.publicKey
              ..topics = p.topics
              ..isMe = p.isMe;
            await isar.profileCollections.put(collection);
          }
        }
      });
      developer.log(
        'Data Migration completed successfully.',
        name: 'MigrationService',
      );
    } catch (e, stackTrace) {
      developer.log(
        'Data Migration failed',
        name: 'MigrationService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
