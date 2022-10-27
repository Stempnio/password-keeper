import 'package:credentials_repository/credentials_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/bloc/credentials_bloc.dart';

class EditCredentials extends StatefulWidget {
  const EditCredentials({
    Key? key,
    required this.actionHandler,
    required this.inputCredentials,
  }) : super(key: key);

  final Function(Credentials credentials) actionHandler;
  final Credentials inputCredentials;

  @override
  State<EditCredentials> createState() => _EditCredentialsState();
}

class _EditCredentialsState extends State<EditCredentials> {
  final _formKey = GlobalKey<FormState>();

  String websiteURL = "";
  String login = "";
  String passwordHash = "";

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
                        initialValue: widget.inputCredentials.websiteURL,
                        decoration: const InputDecoration(
                          hintText: 'Website URL',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Website URL can not be empty';
                          } else {
                            setState(() {
                              websiteURL = value;
                            });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: widget.inputCredentials.login,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username can not be empty';
                          } else {
                            setState(() {
                              login = value;
                            });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: widget.inputCredentials.passwordHash,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          } else {
                            setState(() {
                              passwordHash = value;
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
                            widget.actionHandler(
                              Credentials(
                                websiteURL: websiteURL,
                                login: login,
                                passwordHash: passwordHash,
                              ),
                            );
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
