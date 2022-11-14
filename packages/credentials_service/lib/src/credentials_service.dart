import 'package:credentials_service/credentials_service.dart';

/// {@template credentials_service}
/// The interface for an API that provides access to a list of todos.
/// {@endtemplate}
abstract class CredentialsService {
  /// {@macro credentials_service}
  const CredentialsService();

  Stream<List<Credentials>> getCredentials();

  Future<void> addCredentials(Credentials credentials);

  Future<void> deleteCredentials(Credentials credentials);

  Future<void> editCredentials(
      Credentials editedCredentials, Credentials newCredentials);
}

class GetUserException implements Exception {}

class GetCredentialsException implements Exception {}

class AddCredentialsException implements Exception {}

class DeleteCredentialsException implements Exception {}

class EditCredentialsException implements Exception {}
