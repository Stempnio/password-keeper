import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';

class CredentialsRow extends StatefulWidget {
  final Credentials credentials;

  const CredentialsRow({required this.credentials, Key? key}) : super(key: key);

  @override
  State<CredentialsRow> createState() => _CredentialsRowState();
}

class _CredentialsRowState extends State<CredentialsRow> {
  bool showingPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.credentials.websiteURL,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            if (showingPassword)
              Text(widget.credentials.passwordHash)
            else
              const Text('*********'),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (showingPassword) {
                    showingPassword = false;
                  } else {
                    showingPassword = true;
                  }
                });
              },
              icon: Icon(
                showingPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
