part of 'credentials_bloc.dart';

abstract class CredentialsEvent extends Equatable {
  const CredentialsEvent();
}

class CredentialsEdited extends CredentialsEvent {
  const CredentialsEdited({required this.index, required this.credentials});

  final int index;
  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
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

class CredentialsFetched extends CredentialsEvent {
  @override
  List<Object> get props => [];
}
