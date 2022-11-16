class EncryptionException implements Exception {}

class DecryptionException implements Exception {}

abstract class CryptoRepository {
  String encrypt(String value);

  String decrypt(String value);
}
