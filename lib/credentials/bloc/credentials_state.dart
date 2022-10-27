part of 'credentials_bloc.dart';

enum CredentialsStatus {
  initial,
  loading,
  success,
  failure,
}

class CredentialsState extends Equatable {
  const CredentialsState({required this.status, required this.credentials});

  final CredentialsStatus status;
  final List<Credentials> credentials;

  CredentialsState copyWith({
    CredentialsStatus? status,
    List<Credentials>? credentials,
  }) {
    return CredentialsState(
      status: status ?? this.status,
      credentials: credentials ?? this.credentials,
    );
  }

  @override
  List<Object?> get props => [
        status,
        credentials,
      ];
}
