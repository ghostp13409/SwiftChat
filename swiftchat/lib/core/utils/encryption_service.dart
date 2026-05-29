import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class EncryptionService {
  final algorithm = AesGcm.with256bits();

  Future<String> encrypt(String text, SecretKey secretKey) async {
    final clearText = utf8.encode(text);
    final secretBox = await algorithm.encrypt(clearText, secretKey: secretKey);
    return base64Encode(secretBox.concatenation());
  }

  Future<String> decrypt(String cipherTextBase64, SecretKey secretKey) async {
    final cipherText = base64Decode(cipherTextBase64);
    final secretBox = SecretBox.fromConcatenation(
      cipherText,
      nonceLength: algorithm.nonceLength,
      macLength: algorithm.macAlgorithm.macLength,
    );
    final clearText = await algorithm.decrypt(secretBox, secretKey: secretKey);
    return utf8.decode(clearText);
  }
}
