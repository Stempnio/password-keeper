part of 'credentials_bloc.dart';

abstract class CredentialsEvent extends Equatable {
  const CredentialsEvent();
}

class CredentialsSubscriptionRequested extends CredentialsEvent {
  @override
  List<Object?> get props => [];
}

class CredentialsEdited extends CredentialsEvent {
  const CredentialsEdited(
      {required this.editedCredentials, required this.newCredentials});

  final Credentials editedCredentials;
  final Credentials newCredentials;

  @override
  List<Object?> get props => [
        editedCredentials,
        newCredentials,
      ];
}

class CredentialsAdded extends CredentialsEvent {
  const CredentialsAdded({required this.credentials});

  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
      ];
}

class CredentialsDeleted extends CredentialsEvent {
  const CredentialsDeleted({required this.credentials});

  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
      ];
}
