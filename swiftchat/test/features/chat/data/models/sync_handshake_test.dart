import 'package:flutter_test/flutter_test.dart';
import 'package:swiftchat/features/chat/data/models/sync_handshake.dart';

void main() {
  group('SyncHandshake', () {
    test('should convert to and from JSON correctly', () {
      final packets = {
        'hash1': 1000,
        'hash2': 2000,
      };
      final handshake = SyncHandshake(packets: packets);

      final json = handshake.toJson();
      expect(json['type'], 'sync_handshake');
      expect(json['packets'], packets);

      final fromJson = SyncHandshake.fromJson(json);
      expect(fromJson.packets, packets);
    });

    test('should throw FormatException for invalid JSON', () {
      final json = {'type': 'wrong_type', 'packets': {}};
      expect(() => SyncHandshake.fromJson(json), throwsA(isA<FormatException>()));
    });
  });
}
