import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:password_keeper/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasscodePage extends StatefulWidget {
  const SetPasscodePage({Key? key}) : super(key: key);

  @override
  State<SetPasscodePage> createState() => _SetPasscodePageState();
}

class _SetPasscodePageState extends State<SetPasscodePage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                // on first launch user is asked for pass code and is not authenticated
                if (state.status == AuthenticationStatus.authenticated) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter your pass code",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: "Confirm your pass code",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () => _setPassCode(
                  _passwordController.text,
                  _confirmPasswordController.text,
                ),
                child: const Text(
                  "Set pass code",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setPassCode(String passcode, String confirmedPasscode) {
    if (passcode != confirmedPasscode) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passcodes are not equal"),
        ),
      );
    } else {
      context.read<AuthenticationBloc>().add(SetAuthenticationData(
          authenticationData: AuthenticationData(passCode: passcode)));
    }
  }
}
