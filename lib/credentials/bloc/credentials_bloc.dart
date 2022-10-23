import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:equatable/equatable.dart';

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
      CredentialsFetched event, Emitter<CredentialsState> emitter) async {
    _credentialsRepository.getCredentials();
  }

  Future<void> _onCredentialsEdited(
    CredentialsEdited event,
    Emitter<CredentialsState> emitter,
  ) async {
    _credentialsRepository.modifyCredentials(event.index, event.credentials);
  }

  Future<void> _onCredentialsAdded(
    CredentialsAdded event,
    Emitter<CredentialsState> emitter,
  ) async {
    _credentialsRepository.addCredentials(event.credentials);
  }

  Future<void> _onCredentialsDeleted(
    CredentialsDeleted event,
    Emitter<CredentialsState> emitter,
  ) async {
    _credentialsRepository.deleteCredentials(event.credentials);
  }
}
