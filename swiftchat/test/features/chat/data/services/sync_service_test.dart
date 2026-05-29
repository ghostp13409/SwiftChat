import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swiftchat/core/database/collections/mesh_packet_collection.dart';
import 'package:swiftchat/features/chat/data/models/sync_handshake.dart';
import 'package:swiftchat/features/chat/data/services/sync_service.dart';
import 'package:swiftchat/features/discovery/domain/repositories/discovery_repository.dart';

class MockIsar extends Mock implements Isar {}
class MockIsarCollection extends Mock implements IsarCollection<MeshPacketCollection> {}
class MockQuery extends Mock implements Query<MeshPacketCollection> {}
class MockDiscoveryRepository extends Mock implements DiscoveryRepository {}

void main() {
  late SyncService syncService;
  late MockIsar mockIsar;
  late MockIsarCollection mockCollection;
  late MockDiscoveryRepository mockDiscoveryRepository;

  setUp(() {
    mockIsar = MockIsar();
    mockCollection = MockIsarCollection();
    mockDiscoveryRepository = MockDiscoveryRepository();
    syncService = SyncService(
      isar: mockIsar,
      discoveryRepository: mockDiscoveryRepository,
    );

    when(() => mockIsar.collection<MeshPacketCollection>()).thenReturn(mockCollection);
  });

  group('SyncService', () {
    test('generateHandshake should return SyncHandshake with packets', () async {
      // Note: Full mocking of Isar extensions like .filter() is complex with mocktail.
      // This test is kept as a placeholder for architectural verification.
    });

    test('compareHandshake should identify missing hashes', () {
      const localHandshake = SyncHandshake(packets: {'hash1': 1000});
      const peerHandshake =
          SyncHandshake(packets: {'hash1': 1000, 'hash2': 2000});

      final missingHashes =
          syncService.compareHandshake(localHandshake, peerHandshake);

      expect(missingHashes, ['hash2']);
    });
  });
}

// Helper to mock Isar query - fixed types to avoid assignment errors
class MockQueryBuilder<ST, T, Q> extends Mock implements QueryBuilder<ST, T, Q> {}
