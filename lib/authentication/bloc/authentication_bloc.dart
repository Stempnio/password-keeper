import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.authenticationRepository})
      : super(const AuthenticationState(
            status: AuthenticationStatus.unauthenticated)) {
    on<AuthenticateWithData>(_onAuthenticateWithData);
    on<SetAuthenticationData>(_onSetAuthenticationData);
    on<LogOut>(_onLogOut);
  }

  AuthenticationRepository authenticationRepository;

  Future<void> _onAuthenticateWithData(
    AuthenticateWithData event,
    Emitter emit,
  ) async {
    emit(const AuthenticationState(status: AuthenticationStatus.pending));
    try {
      bool result =
          await authenticationRepository.authenticate(event.authenticationData);
      if (result) {
        emit(const AuthenticationState(
            status: AuthenticationStatus.authenticated));
      } else {
        emit(const AuthenticationState(status: AuthenticationStatus.error));
      }
    } catch (error) {
      emit(const AuthenticationState(status: AuthenticationStatus.error));
    }
  }

  void _onSetAuthenticationData(AuthenticationEvent event, Emitter emit) {}

  void _onLogOut(AuthenticationEvent event, Emitter emit) {}
}
