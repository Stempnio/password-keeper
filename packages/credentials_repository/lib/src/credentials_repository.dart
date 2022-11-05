import 'dart:async';
import 'package:credentials_service/credentials_service.dart';

class CredentialsRepository {
  const CredentialsRepository({
    required CredentialsService service,
  }) : _service = service;

  final CredentialsService _service;

  Stream<List<Credentials>> getCredentials() => _service.getCredentials();

  Future<void> addCredentials(Credentials credentials) =>
      _service.addCredentials(credentials);

  Future<void> deleteCredentials(Credentials credentials) =>
      _service.deleteCredentials(credentials);

  Future<void> editCredentials(int index, Credentials editedCredentials) =>
      _service.editCredentials(index, editedCredentials);
}
