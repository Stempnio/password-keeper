import 'package:encrypt/encrypt.dart';
import 'secrets/keys.dart';

class PasswordEncryptionException implements Exception {}

class PasswordDecryptionException implements Exception {}

class PasswordCrypter {
  static String encrypt(String password) {
    try {
      final key = Key.fromUtf8(aesKey);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      return encrypter.encrypt(password, iv: iv).base64;
    } catch (e) {
      print(e);
      throw PasswordEncryptionException();
    }
  }

  static String decrypt(String passwordHash) {
    try {
      final key = Key.fromUtf8(aesKey);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      return encrypter.decrypt(Encrypted.fromBase64(passwordHash), iv: iv);
    } catch (e) {
      print(e);
      throw PasswordDecryptionException();
    }
  }
}
