import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/edit_credentials/edit_credentials.dart';
import 'package:password_keeper/credentials/credentials.dart';
import 'package:credentials_repository/credentials_repository.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'add_credentials',
      onPressed: () => Navigator.push(
        context,
        EditCredentialsRoute(
          builder: (context) => EditCredentials(
            inputCredentials:
                const Credentials(login: "", passwordHash: "", websiteURL: ""),
            actionHandler: (credentials) {
              context
                  .read<CredentialsBloc>()
                  .add(CredentialsAdded(credentials: credentials));
            },
          ),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}