import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:password_keeper/credentials/credentials.dart';

class CredentialsList extends StatelessWidget {
  const CredentialsList({Key? key, required this.credentials})
      : super(key: key);

  final List<Credentials> credentials;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: credentials.length,
      itemBuilder: (context, index) {
        var separator = index == 0 ||
                credentials[index - 1].websiteURL[0] !=
                    credentials[index].websiteURL[0]
            ? LetterSeparator(
                letter: credentials[index].websiteURL[0].toUpperCase(),
              )
            : Container();
        return Column(
          children: [
            separator,
            InkWell(
              onLongPress: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => CredentialsActionSheet(
                    credentials: credentials[index],
                    index: index,
                  ),
                );
              },
              child: CredentialsRow(
                credentials: credentials[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
