import 'package:aes_crypto_repository/aes_crypto_repository.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:test/test.dart';

void main() {
  late String sampleKey;
  late CryptoRepository aesCryptoRepository;

  setUp(() {
    sampleKey = '11111111111111111111111111111111';
    aesCryptoRepository = AesCryptoRepository(aesKey: sampleKey);
  });

  test('password gets encrypted and decrypted correctly', () {
    var password = 'password123';
    var passwordHash = aesCryptoRepository.encrypt(password);
    var decryptedPassword = aesCryptoRepository.decrypt(passwordHash);
    expect(passwordHash, isNot(password));
    expect(decryptedPassword, equals(password));
  });

  test('empty password encryption attempt throws exception', () {
    var password = '';
    expect(() => aesCryptoRepository.encrypt(password), throwsException);
  });

  test('empty password decryption attempt throws exception', () {
    var password = '';
    expect(() => aesCryptoRepository.decrypt(password), throwsException);
  });
}
