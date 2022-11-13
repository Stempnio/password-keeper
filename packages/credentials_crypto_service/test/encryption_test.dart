import 'package:credentials_crypto_service/credentials_crypto_service.dart';
import 'package:test/test.dart';

void main() {
  test('password gets encrypted and decrypted correctly', () {
    var password = 'password123';
    var passwordHash = PasswordCrypter.encrypt(password);
    var decryptedPassword = PasswordCrypter.decrypt(passwordHash);
    expect(passwordHash, isNot(password));
    expect(decryptedPassword, equals(password));
  });

  test('empty password encryption attempt throws exception', () {
    var password = '';
    expect(() => PasswordCrypter.encrypt(password), throwsException);
  });

  test('empty password decryption attempt throws exception', () {
    var password = '';
    expect(() => PasswordCrypter.decrypt(password), throwsException);
  });
}
