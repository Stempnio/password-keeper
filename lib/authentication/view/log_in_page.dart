import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/authentication/authentication.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            decoration: const InputDecoration(hintText: "Enter your password"),
            onSubmitted: (value) => context.read<AuthenticationBloc>().add(
                  AuthenticateWithData(
                    authenticationData: AuthenticationData(passCode: value),
                  ),
                ),
            // onChanged: (value) => {},
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
