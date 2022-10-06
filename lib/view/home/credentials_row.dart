import 'package:flutter/material.dart';
import 'package:password_keeper/model/credentials.dart';

class CredentialsRow extends StatefulWidget {
  final Credentials credentials;
  final Function edit;

  const CredentialsRow(
      {required this.credentials, required this.edit, Key? key})
      : super(key: key);

  @override
  State<CredentialsRow> createState() => _CredentialsRowState();
}

class _CredentialsRowState extends State<CredentialsRow> {
  bool showingPassword = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
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
              const Text(
                '*********',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
            IconButton(
              onPressed: () {
                widget.edit();
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
