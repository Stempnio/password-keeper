import 'package:credentials_service/credentials_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/edit_credentials/edit_credentials.dart';
import 'package:password_keeper/credentials/credentials.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: 'add_credentials',
          onPressed: () => Navigator.push(
            context,
            EditCredentialsRoute(
              builder: (context) => EditCredentials(
                inputCredentials: const Credentials(
                    login: "", passwordHash: "", websiteURL: ""),
                actionHandler: (credentials) {
                  context
                      .read<CredentialsBloc>()
                      .add(CredentialsAdded(credentials: credentials));
                },
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2)),
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
