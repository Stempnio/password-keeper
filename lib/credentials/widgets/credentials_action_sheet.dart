import 'package:credentials_service/credentials_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/edit_credentials/edit_credentials.dart';
import 'package:password_keeper/credentials/credentials.dart';

class CredentialsActionSheet extends StatelessWidget {
  const CredentialsActionSheet(
      {Key? key, required this.credentials, this.index})
      : super(key: key);

  final Credentials credentials;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(credentials.websiteURL),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            Navigator.push(
              context,
              EditCredentialsRoute(
                builder: (context) => EditCredentials(
                  inputCredentials: credentials,
                  actionHandler: (newCredentials) {
                    context.read<CredentialsBloc>().add(
                          CredentialsEdited(
                            editedCredentials: credentials,
                            newCredentials: newCredentials,
                          ),
                        );
                  },
                ),
              ),
            );
          },
          child: const Text("Edit"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            context
                .read<CredentialsBloc>()
                .add(CredentialsDeleted(credentials: credentials));
          },
          isDestructiveAction: true,
          child: const Text("Delete credentials"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(), // dismiss action sheet,
      ),
    );
  }
}
