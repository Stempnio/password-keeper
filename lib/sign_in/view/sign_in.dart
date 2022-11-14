import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/bloc/credentials_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          context
              .read<CredentialsBloc>()
              .add(CredentialsSubscriptionRequested());
          Navigator.pushReplacementNamed(context, '/main');
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          _showUserCreatedSnackBar(context);
        })
      ],
      headerBuilder: (context, constraints, _) => const Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Password keeper',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showUserCreatedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          backgroundColor: Colors.grey,
          content: Text(
            'Account created successfully',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
  }
}
