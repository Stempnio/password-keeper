import 'package:authentication_repository/authentication_repository.dart';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/app/app.dart';
import 'package:password_keeper/authentication/authentication.dart';
import 'package:password_keeper/credentials/bloc/credentials_bloc.dart';
import 'package:password_keeper/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final credentialsRepository = CredentialsRepository();
  final authenticationRepository = AuthenticationRepository();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => credentialsRepository,
      ),
      RepositoryProvider(
        create: (context) => authenticationRepository,
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CredentialsBloc(credentialsRepository: credentialsRepository)
                ..add(
                  CredentialsFetched(),
                ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
              authenticationRepository: authenticationRepository)
            ..add(CheckIfAuthenticationDataIsSaved()),
        ),
      ],
      child: const App(),
    ),
  ));
}
