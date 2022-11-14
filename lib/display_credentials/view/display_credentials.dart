import 'package:credentials_service/credentials_service.dart';
import 'package:flutter/material.dart';
import 'package:password_keeper/display_credentials/display_credentials.dart';

class DisplayCredentials extends StatelessWidget {
  const DisplayCredentials(
      {Key? key, required this.credentials, required this.decryptedPassword})
      : super(key: key);

  final Credentials credentials;
  final String decryptedPassword;

  static Route<void> route(Credentials credentials, String passwordHash) {
    return DisplayCredentialsRoute(
      builder: (context) => DisplayCredentials(
        credentials: credentials,
        decryptedPassword: passwordHash,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  credentials.websiteURL,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Divider(),
                DisplayCredentialsTile(
                  leadingIcon: Icons.person_sharp,
                  value: credentials.login,
                ),
                const Divider(),
                DisplayCredentialsTile(
                  leadingIcon: Icons.lock,
                  value: decryptedPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
