part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, pending, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status, this.message});

  final AuthenticationStatus status;
  final String? message;

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    String? errorMessage,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      message: errorMessage ?? '',
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
