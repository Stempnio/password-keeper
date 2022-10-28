part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, pending, unauthenticated, error }

class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status});

  final AuthenticationStatus status;

  // final AuthenticationData authenticationData;

  AuthenticationState copyWith(
      AuthenticationStatus? status, AuthenticationData? data) {
    return AuthenticationState(
      status: status ?? this.status,
      // authenticationData: data ?? authenticationData,
    );
  }

  @override
  List<Object?> get props => [
        status,
        // authenticationData,
      ];
}
