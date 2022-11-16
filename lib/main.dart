import 'package:aes_crypto_repository/aes_crypto_repository.dart';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firestore_credentials_service/firestore_credentials_service.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/app/app.dart';
import 'package:password_keeper/credentials/bloc/credentials_bloc.dart';
import 'package:password_keeper/theme/theme.dart';
import 'package:password_keeper/secrets/secrets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  final credentialsService = FirestoreCredentialsService();
  final credentialsRepository =
      CredentialsRepository(service: credentialsService);

  const CryptoRepository cryptoRepository = AesCryptoRepository(aesKey: aesKey);

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => credentialsRepository,
      ),
      RepositoryProvider(
        create: (context) => cryptoRepository,
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CredentialsBloc(credentialsRepository: credentialsRepository)
                ..add(CredentialsSubscriptionRequested()),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const App(),
    ),
  ));
}
