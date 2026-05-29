import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:cryptography/cryptography.dart';
import '../../../../core/utils/encryption_service.dart';
import '../../../../core/utils/key_service.dart';
import '../../domain/repositories/discovery_repository.dart';

class HandshakeService {
  HandshakeService({
    required this.discoveryRepository,
    required this.keyService,
    required this.encryptionService,
  });

  final DiscoveryRepository discoveryRepository;
  final KeyService keyService;
  final EncryptionService encryptionService;

  final Map<String, SecretKey> _establishedSecrets = {};
  final Map<String, SimpleKeyPair> _pendingExchanges = {};

  Future<void> initiateHandshake(String endpointId, String myPeerId) async {
    // Deterministic initiation: Only the device with the "higher" Peer ID initiates
    // to avoid race conditions in P2P clusters.
    if (myPeerId.compareTo(endpointId) < 0) {
      developer.log('Handshake: Waiting for peer $endpointId to initiate (Peer ID order)', name: 'swiftchat.handshake');
      return;
    }

    developer.log('Handshake: Initiating with $endpointId', name: 'swiftchat.handshake');
    final keyPair = await keyService.generateExchangeKeyPair();
    _pendingExchanges[endpointId] = keyPair;

    final publicKey = await keyPair.extractPublicKey();
    final handshakeData = {
      'type': 'handshake_init',
      'publicKey': base64Encode(publicKey.bytes),
    };

    await discoveryRepository.sendPayload(endpointId, handshakeData);
  }

  Future<void> handleHandshakePayload(String endpointId, Map<String, dynamic> data) async {
    final String type = data['type'];
    final String peerPublicKeyBase64 = data['publicKey'];

    if (type == 'handshake_init') {
      developer.log('Handshake: Received init from $endpointId', name: 'swiftchat.handshake');
      final myKeyPair = await keyService.generateExchangeKeyPair();
      final secret = await keyService.deriveSharedSecret(myKeyPair, peerPublicKeyBase64);
      _establishedSecrets[endpointId] = secret;

      final myPublicKey = await myKeyPair.extractPublicKey();
      final responseData = {
        'type': 'handshake_response',
        'publicKey': base64Encode(myPublicKey.bytes),
      };
      await discoveryRepository.sendPayload(endpointId, responseData);
      developer.log('Handshake: Secure session established with $endpointId (as responder)', name: 'swiftchat.handshake');
    } else if (type == 'handshake_response') {
      developer.log('Handshake: Received response from $endpointId', name: 'swiftchat.handshake');
      final myKeyPair = _pendingExchanges[endpointId];
      if (myKeyPair != null) {
        final secret = await keyService.deriveSharedSecret(myKeyPair, peerPublicKeyBase64);
        _establishedSecrets[endpointId] = secret;
        _pendingExchanges.remove(endpointId);
        developer.log('Handshake: Secure session established with $endpointId (as initiator)', name: 'swiftchat.handshake');
      } else {
        developer.log('Handshake: Error - Received response from $endpointId but no pending exchange found', name: 'swiftchat.handshake');
      }
    }
  }

  SecretKey? getSecret(String endpointId) => _establishedSecrets[endpointId];
}
