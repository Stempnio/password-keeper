part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class CheckIfAuthenticationDataIsSaved extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class SetAuthenticationData extends AuthenticationEvent {
  const SetAuthenticationData({required this.authenticationData});

  final AuthenticationData authenticationData;

  @override
  List<Object?> get props => [authenticationData];
}

class AuthenticateWithData extends AuthenticationEvent {
  const AuthenticateWithData({required this.authenticationData});

  final AuthenticationData authenticationData;

  @override
  List<Object?> get props => [authenticationData];
}

class LogOut extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
