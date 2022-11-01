import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/authentication/authentication.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.authenticationRepository})
      : super(const AuthenticationState(status: AuthenticationStatus.initial)) {
    on<AuthenticateWithData>(_onAuthenticateWithData);
    on<SetAuthenticationData>(_onSetAuthenticationData);
    on<CheckIfAuthenticationDataIsSaved>(_onCheckIfAuthenticationDataIsSaved);
    on<LogOut>(_onLogOut);
  }

  AuthenticationRepository authenticationRepository;

  Future<void> _onAuthenticateWithData(
    AuthenticateWithData event,
    Emitter emit,
  ) async {
    bool result =
        await authenticationRepository.authenticate(event.authenticationData);
    if (result) {
      emit(const AuthenticationState(
          status: AuthenticationStatus.authenticated));
    } else {
      emit(const AuthenticationState(
          status: AuthenticationStatus.unauthenticated,
          message: 'Authentication failed!'));
    }
  }

  Future<void> _onSetAuthenticationData(
      SetAuthenticationData event, Emitter emit) async {
    try {
      await authenticationRepository
          .setAuthenticationData(event.authenticationData);
      emit(const AuthenticationState(
          status: AuthenticationStatus.authenticated,
          message: "Pass code set successfully"));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onCheckIfAuthenticationDataIsSaved(
    CheckIfAuthenticationDataIsSaved event,
    Emitter emit,
  ) async {
    bool saved = await authenticationRepository.authenticationDataSaved();
    if (saved) {
      emit(const AuthenticationState(
          status: AuthenticationStatus.unauthenticated));
    } else {
      emit(const AuthenticationState(status: AuthenticationStatus.firstTime));
    }
  }

  Future<void> _onLogOut(LogOut event, Emitter emit) async {
    emit(const AuthenticationState(
        status: AuthenticationStatus.unauthenticated));
  }
}
