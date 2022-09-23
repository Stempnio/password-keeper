import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';

class CredentialsRow extends StatefulWidget {
  final Credentials credentials;
  final Function delete;

  const CredentialsRow(
      {required this.credentials, required this.delete, Key? key})
      : super(key: key);

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
            IconButton(
              onPressed: () {
                widget.delete();
              },
              icon: const Icon(Icons.delete),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.credentials.websiteURL,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.credentials.login)
              ],
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
