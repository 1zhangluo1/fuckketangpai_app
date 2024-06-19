import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';


Uint8List pad(Uint8List data, int blockSize) {
  int padding = blockSize - (data.length % blockSize);
  Uint8List result = Uint8List(data.length + padding);
  result.setAll(0, data);
  result.fillRange(data.length, result.length, padding);
  return result;
}

String encryptByCBC(String password, String key, String iv) {
  // Ensure the key and IV are bytes
  Uint8List keyBytes = Uint8List.fromList(utf8.encode(key));
  Uint8List ivBytes = Uint8List.fromList(utf8.encode(iv));

  // Create AES CBC cipher object
  final keyParam = KeyParameter(keyBytes);
  final params = ParametersWithIV(keyParam, ivBytes);
  final cipher = CBCBlockCipher(AESEngine())
    ..init(true, params); // true=encrypt

  // Pad the password to be a multiple of block size (16 bytes for AES)
  Uint8List paddedPassword = pad(Uint8List.fromList(utf8.encode(password)), cipher.blockSize);

  // Encrypt the padded password
  Uint8List encryptedPassword = Uint8List(paddedPassword.length);
  for (int offset = 0; offset < paddedPassword.length; offset += cipher.blockSize) {
    cipher.processBlock(paddedPassword, offset, encryptedPassword, offset);
  }

  // Encode the encrypted password as base64 for readability
  String encryptedPasswordBase64 = base64Encode(encryptedPassword);
  return encryptedPasswordBase64;
}