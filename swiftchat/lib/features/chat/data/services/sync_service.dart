import 'dart:developer' as developer;
import 'package:isar/isar.dart';
import '../../../../core/database/collections/mesh_packet_collection.dart';
import '../../../discovery/domain/repositories/discovery_repository.dart';
import '../models/sync_handshake.dart';

class SyncService {
  SyncService({
    required this.isar,
    required this.discoveryRepository,
  });

  final Isar isar;
  final DiscoveryRepository discoveryRepository;

  /// Generates a handshake containing local packet hashes and their timestamps.
  /// Filters for non-expired packets and limits the total count for efficiency.
  Future<SyncHandshake> generateHandshake() async {
    final now = DateTime.now();
    final packets = await isar.meshPacketCollections
        .filter()
        .ttlGreaterThan(now)
        .sortByCreatedAtDesc()
        .limit(200)
        .findAll();

    final handshakeData = <String, int>{};
    for (final packet in packets) {
      handshakeData[packet.messageHash] =
          packet.createdAt.millisecondsSinceEpoch;
    }
    return SyncHandshake(packets: handshakeData);
  }

  /// Initiates the sync process by sending a handshake to a peer.
  Future<void> sendHandshake(String endpointId) async {
    try {
      final handshake = await generateHandshake();
      await discoveryRepository.sendPayload(endpointId, handshake.toJson());
    } catch (e, stackTrace) {
      developer.log(
        'Failed to send handshake to $endpointId',
        name: 'SyncService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Compares local handshake with peer handshake and returns a list of missing hashes.
  List<String> compareHandshake(SyncHandshake local, SyncHandshake peer) {
    final missingHashes = <String>[];
    peer.packets.forEach((hash, timestamp) {
      if (!local.packets.containsKey(hash)) {
        missingHashes.add(hash);
      }
    });
    return missingHashes;
  }

  /// Handles an incoming handshake from a peer.
  Future<void> handleHandshake(
      String endpointId, Map<String, dynamic> data) async {
    try {
      final peerHandshake = SyncHandshake.fromJson(data);
      final localHandshake = await generateHandshake();
      final missingHashes = compareHandshake(localHandshake, peerHandshake);

      if (missingHashes.isNotEmpty) {
        await discoveryRepository.sendPayload(endpointId, {
          'type': 'sync_request',
          'hashes': missingHashes,
        });
      }
    } catch (e, stackTrace) {
      developer.log(
        'Error handling handshake from $endpointId',
        name: 'SyncService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Processes a sync request for specific packet hashes and sends them.
  Future<void> processSyncRequest(String endpointId, List<String> hashes) async {
    try {
      for (final hash in hashes) {
        final packet = await isar.meshPacketCollections
            .filter()
            .messageHashEqualTo(hash)
            .findFirst();

        if (packet != null) {
          // Verify packet is not expired before sending
          if (packet.ttl.isBefore(DateTime.now())) continue;

          await discoveryRepository.sendPayload(endpointId, {
            'type': 'sync_data',
            'messageHash': packet.messageHash,
            'recipientId': packet.recipientId,
            'payload': packet.payload,
            'ttl': packet.ttl.toIso8601String(),
            'createdAt': packet.createdAt.toIso8601String(),
          });
        }
      }
    } catch (e, stackTrace) {
      developer.log(
        'Error processing sync request from $endpointId',
        name: 'SyncService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Handles incoming sync data and saves it to local storage.
  Future<void> handleSyncData(Map<String, dynamic> data) async {
    try {
      final messageHash = data['messageHash'] as String?;
      if (messageHash == null) return;

      // Check if we already have this packet
      final existing = await isar.meshPacketCollections
          .filter()
          .messageHashEqualTo(messageHash)
          .findFirst();

      if (existing == null) {
        final ttlString = data['ttl'] as String?;
        final createdAtString = data['createdAt'] as String?;
        if (ttlString == null || createdAtString == null) return;

        final ttl = DateTime.parse(ttlString);
        // Don't save if already expired
        if (ttl.isBefore(DateTime.now())) return;

        final packet = MeshPacketCollection()
          ..messageHash = messageHash
          ..recipientId = (data['recipientId'] as String? ?? '')
          ..payload = (data['payload'] as String? ?? '')
          ..ttl = ttl
          ..createdAt = DateTime.parse(createdAtString);

        await isar.writeTxn(() async {
          await isar.meshPacketCollections.put(packet);
        });
      }
    } catch (e, stackTrace) {
      developer.log(
        'Error handling sync data',
        name: 'SyncService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
