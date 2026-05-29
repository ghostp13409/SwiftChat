import 'dart:async';
import 'dart:developer' as developer;
import 'package:isar_community/isar.dart';
import '../database/collections/message_collection.dart';
import '../database/collections/mesh_packet_collection.dart';

class CleanupWorker {
  CleanupWorker(this.isar);

  final Isar isar;
  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 30), (timer) {
      _runCleanup();
    });
    // Run once on start with a short delay
    Future.delayed(const Duration(seconds: 10), () => _runCleanup());
    developer.log('CleanupWorker started', name: 'CleanupWorker');
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    developer.log('CleanupWorker stopped', name: 'CleanupWorker');
  }

  Future<void> _runCleanup() async {
    try {
      final now = DateTime.now();
      
      await isar.writeTxn(() async {
        // 1. Delete expired messages
        final expiredMessagesCount = await isar.messageCollections
            .filter()
            .ttlLessThan(now)
            .deleteAll();
        
        // 2. Delete expired mesh packets
        final expiredPacketsCount = await isar.meshPacketCollections
            .filter()
            .ttlLessThan(now)
            .deleteAll();

        if (expiredMessagesCount > 0 || expiredPacketsCount > 0) {
          developer.log(
            'Deleted $expiredMessagesCount expired messages and $expiredPacketsCount expired packets',
            name: 'CleanupWorker',
          );
        }

        // 3. Enforce MeshPacketCollection limit (2000 records, FIFO)
        final packetCount = await isar.meshPacketCollections.count();
        if (packetCount > 2000) {
          final toDelete = packetCount - 2000;
          final oldestPackets = await isar.meshPacketCollections
              .where()
              .sortByCreatedAt()
              .limit(toDelete)
              .findAll();
          
          final idsToDelete = oldestPackets.map((e) => e.id).toList();
          await isar.meshPacketCollections.deleteAll(idsToDelete);
          
          developer.log(
            'Enforced limit: Deleted $toDelete oldest mesh packets',
            name: 'CleanupWorker',
          );
        }
      });
    } catch (e, stackTrace) {
      developer.log(
        'Cleanup failed',
        name: 'CleanupWorker',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
