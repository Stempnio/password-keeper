import 'package:encrypt/encrypt.dart';
import 'package:crypto_repository/crypto_repository.dart';

class AesCryptoRepository implements CryptoRepository {
  const AesCryptoRepository({required String aesKey}) : _aesKey = aesKey;

  final String _aesKey;

  String encrypt(String password) {
    try {
      final key = Key.fromUtf8(_aesKey);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      return encrypter.encrypt(password, iv: iv).base64;
    } catch (e) {
      print(e);
      throw EncryptionException();
    }
  }

  String decrypt(String passwordHash) {
    try {
      final key = Key.fromUtf8(_aesKey);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      return encrypter.decrypt(Encrypted.fromBase64(passwordHash), iv: iv);
    } catch (e) {
      print(e);
      throw DecryptionException();
    }
  }
}
