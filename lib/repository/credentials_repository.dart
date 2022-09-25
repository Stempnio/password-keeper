import '../model/Credentials.dart';

class CredentialsRepository {
  List<Credentials> _credentials = [
    Credentials(
        websiteURL: 'website1.com', login: 'login', passwordHash: 'pass1'),
    Credentials(
        websiteURL: 'website2.com', login: 'login', passwordHash: 'pass2'),
    Credentials(
        websiteURL: 'website3.com', login: 'login', passwordHash: 'pass3'),
    Credentials(
        websiteURL: 'website4.com', login: 'login', passwordHash: 'pass4'),
  ];

  getCredentials() async {
    List<Credentials> result = await Future.delayed(
      const Duration(seconds: 2),
      () {
        return _credentials;
      },
    );

    return result;
  }

  deleteCredentials(Credentials el) {
    _credentials.remove(el);
  }
}
