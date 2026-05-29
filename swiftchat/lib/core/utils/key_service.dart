import 'package:cryptography/cryptography.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';

class KeyPairStrings extends Equatable {
  const KeyPairStrings({required this.publicKey, required this.privateKey});
  final String publicKey;
  final String privateKey;

  @override
  List<Object> get props => [publicKey, privateKey];
}

class KeyService {
  final ed25519 = Ed25519();
  final x25519 = X25519();

  Future<KeyPairStrings> generateIdentityKeyPair() async {
    final keyPair = await ed25519.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();
    final privateKey = await keyPair.extractPrivateKeyBytes();

    return KeyPairStrings(
      publicKey: base64Encode(publicKey.bytes),
      privateKey: base64Encode(privateKey),
    );
  }

  Future<SimpleKeyPair> generateExchangeKeyPair() async {
    return x25519.newKeyPair();
  }

  Future<SecretKey> deriveSharedSecret(
    SimpleKeyPair myKeyPair,
    String peerPublicKeyBase64,
  ) async {
    final peerPublicKey = SimplePublicKey(
      base64Decode(peerPublicKeyBase64),
      type: KeyPairType.x25519,
    );
    return x25519.sharedSecretKey(
      keyPair: myKeyPair,
      remotePublicKey: peerPublicKey,
    );
  }
}
