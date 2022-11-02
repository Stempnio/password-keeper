import 'dart:async';
import 'package:credentials_repository/src/models/models.dart';

class CredentialsRepository {
  List<Credentials> _credentials = [
    Credentials(websiteURL: 'onet.pl', login: 'login', passwordHash: 'pass1'),
    Credentials(websiteURL: 'oreo.pl', login: 'login', passwordHash: 'pass1'),
    Credentials(
        websiteURL: 'youtube.com', login: 'login', passwordHash: 'pass2'),
    Credentials(
        websiteURL: 'google.com', login: 'login', passwordHash: 'pass3'),
    Credentials(
        websiteURL: 'gugogugo.com', login: 'login', passwordHash: 'pass4'),
  ];

  Future<List<Credentials>> getCredentials() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => [..._credentials],
    );
  }

  Future<void> deleteCredentials(Credentials el) async {
    // try {
    _credentials.remove(el);
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  Future<void> modifyCredentials(int index, Credentials el) async {
    // try {
    _credentials[index] = el;
    //   return true;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }

  Future<void> addCredentials(Credentials el) async {
    // try {
    _credentials.add(el);
    //   return true;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
  }
}
