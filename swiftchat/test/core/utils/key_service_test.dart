import 'package:flutter_test/flutter_test.dart';
import 'package:swiftchat/core/utils/key_service.dart';

void main() {
  group('KeyService', () {
    late KeyService keyService;

    setUp(() {
      keyService = KeyService();
    });

    test('should generate a valid Ed25519 key pair', () async {
      // Act
      final result = await keyService.generateIdentityKeyPair();

      // Assert
      expect(result.publicKey, isNotEmpty);
      expect(result.privateKey, isNotEmpty);
      expect(result.publicKey, isNot(equals(result.privateKey)));
    });

    test('should generate unique key pairs on every call', () async {
      // Act
      final pair1 = await keyService.generateIdentityKeyPair();
      final pair2 = await keyService.generateIdentityKeyPair();

      // Assert
      expect(pair1.publicKey, isNot(equals(pair2.publicKey)));
      expect(pair1.privateKey, isNot(equals(pair2.privateKey)));
    });
  });
}
