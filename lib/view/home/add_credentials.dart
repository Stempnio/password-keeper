import 'package:flutter/material.dart';

import 'package:password_keeper/model/credentials.dart';

class AddCredentials extends StatefulWidget {
  const AddCredentials({required this.modifyCredentials, Key? key})
      : super(key: key);

  final Function modifyCredentials;

  @override
  State<AddCredentials> createState() => _AddCredentialsState();
}

class _AddCredentialsState extends State<AddCredentials> {
  final _formKey = GlobalKey<FormState>();

  // Function modifyCredentials;
  // Credentials credentials;
  //
  // _AddCredentialsState({
  //   required this.credentials,
  //   required this.modifyCredentials,
  // });

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
                      // Row(
                      //   children: const [
                      //     Spacer(),
                      //     Icon(Icons.close, color: Colors.red),
                      //   ],
                      // ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Website URL',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Website URL can not be empty';
                          } else {
                            // setState(() {
                            //   credentials.websiteURL = value;
                            // });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username can not be empty';
                          } else {
                            // setState(() {
                            //   credentials.login = value;
                            // });
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          } else {
                            // setState(() {
                            //   credentials.passwordHash = value;
                            // });
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
                            widget.modifyCredentials;
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Add'),
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
