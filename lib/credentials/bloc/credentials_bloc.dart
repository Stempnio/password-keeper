import 'dart:async';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'credentials_event.dart';

part 'credentials_state.dart';

class CredentialsBloc extends Bloc<CredentialsEvent, CredentialsState> {
  CredentialsBloc({required CredentialsRepository credentialsRepository})
      : _credentialsRepository = credentialsRepository,
        super(const CredentialsState(
          status: CredentialsStatus.initial,
          credentials: [],
        )) {
    on<CredentialsEdited>(_onCredentialsEdited);
    on<CredentialsAdded>(_onCredentialsAdded);
    on<CredentialsDeleted>(_onCredentialsDeleted);
    on<CredentialsFetched>(_onCredentialsFetched);
  }

  final CredentialsRepository _credentialsRepository;

  Future<void> _onCredentialsFetched(
    CredentialsFetched event,
    Emitter<CredentialsState> emit,
  ) async {
    emit(state.copyWith(status: CredentialsStatus.loading));

    try {
      final credentials = await _credentialsRepository.getCredentials();
      emit(state.copyWith(
        status: CredentialsStatus.success,
        credentials: credentials,
      ));
    } catch (error) {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }

  Future<void> _onCredentialsEdited(
    CredentialsEdited event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      await _credentialsRepository.modifyCredentials(
        event.index,
        event.credentials,
      );

      emit(state.copyWith(
        status: CredentialsStatus.success,
        credentials: [...state.credentials]..[event.index] = event.credentials,
      ));
    } catch (error) {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }

  Future<void> _onCredentialsAdded(
    CredentialsAdded event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      //TODO: double add problem
      await _credentialsRepository.addCredentials(event.credentials);

      emit(state.copyWith(
        status: CredentialsStatus.success,
        credentials: [...state.credentials, event.credentials],
      ));
    } catch (error) {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }

  Future<void> _onCredentialsDeleted(
    CredentialsDeleted event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      await _credentialsRepository.deleteCredentials(event.credentials);

      emit(state.copyWith(
        status: CredentialsStatus.success,
        credentials: [...state.credentials]..remove(event.credentials),
      ));
    } catch (error) {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }
}
