import 'package:credentials_service/credentials_service.dart';
import 'package:crypto_repository/crypto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/display_credentials/display_credentials.dart';

class CredentialsRow extends StatelessWidget {
  const CredentialsRow({required this.credentials, Key? key}) : super(key: key);

  final Credentials credentials;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          credentials.websiteURL,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          credentials.login,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: GestureDetector(
          onTap: () => _displayDecryptedPassword(context),
          child: const Icon(
            Icons.visibility,
            size: 50,
          ),
        ),
      ),
    );
  }

  void _displayDecryptedPassword(BuildContext context) {
    var decryptedPassword =
        context.read<CryptoRepository>().decrypt(credentials.passwordHash);
    Navigator.push(
      context,
      DisplayCredentials.route(credentials, decryptedPassword),
    );
  }
}
