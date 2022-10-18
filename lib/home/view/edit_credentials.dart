import 'package:flutter/material.dart';

import 'package:password_keeper/model/credentials.dart';

class EditCredentials extends StatefulWidget {
  const EditCredentials({
    Key? key,
    required this.actionHandler,
    required this.credentials,
  }) : super(key: key);
  final Function actionHandler;
  final Credentials credentials;

  @override
  State<EditCredentials> createState() => _EditCredentialsState();
}

class _EditCredentialsState extends State<EditCredentials> {
  final _formKey = GlobalKey<FormState>();

  // credentials that are used when invoking actionHandler function
  Credentials credentials = Credentials(
    websiteURL: "",
    login: "",
    passwordHash: "",
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'add_credentials',
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: widget.credentials.websiteURL,
                        decoration: const InputDecoration(
                          hintText: 'Website URL',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Website URL can not be empty';
                          } else {
                            setState(() {
                              credentials.websiteURL = value;
                            });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: widget.credentials.login,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username can not be empty';
                          } else {
                            setState(() {
                              credentials.login = value;
                            });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: widget.credentials.passwordHash,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          } else {
                            setState(() {
                              credentials.passwordHash = value;
                            });
                            return null;
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Create strong password'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.actionHandler(credentials);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
