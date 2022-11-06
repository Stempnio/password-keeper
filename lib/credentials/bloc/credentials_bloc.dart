import 'dart:async';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'credentials_event.dart';

part 'credentials_state.dart';

class CredentialsBloc extends Bloc<CredentialsEvent, CredentialsState> {
  CredentialsBloc({required CredentialsRepository credentialsRepository})
      : _credentialsRepository = credentialsRepository,
        super(const CredentialsState(
          status: CredentialsStatus.loading,
          credentials: [],
        )) {
    on<CredentialsSubscriptionRequested>(_onCredentialsSubscriptionRequested);
    on<CredentialsEdited>(_onCredentialsEdited);
    on<CredentialsAdded>(_onCredentialsAdded);
    on<CredentialsDeleted>(_onCredentialsDeleted);
  }

  final CredentialsRepository _credentialsRepository;

  Future<void> _onCredentialsSubscriptionRequested(
    CredentialsSubscriptionRequested event,
    Emitter<CredentialsState> emit,
  ) async {
    emit(state.copyWith(status: CredentialsStatus.loading));

    await emit.forEach<List<Credentials>>(
      _credentialsRepository.getCredentials(),
      onData: (credentials) => state.copyWith(
        status: CredentialsStatus.success,
        credentials: credentials,
      ),
      onError: (_, __) => state.copyWith(
        status: CredentialsStatus.failure,
      ),
    );
  }

  Future<void> _onCredentialsEdited(
    CredentialsEdited event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      await _credentialsRepository.editCredentials(
        event.editedCredentials,
        event.newCredentials,
      );
    } on EditCredentialsException {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }

  Future<void> _onCredentialsAdded(
    CredentialsAdded event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      await _credentialsRepository.addCredentials(event.credentials);
    } on AddCredentialsException {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }

  Future<void> _onCredentialsDeleted(
    CredentialsDeleted event,
    Emitter<CredentialsState> emit,
  ) async {
    try {
      await _credentialsRepository.deleteCredentials(event.credentials);
    } on DeleteCredentialsException {
      emit(state.copyWith(status: CredentialsStatus.failure));
    }
  }
}
