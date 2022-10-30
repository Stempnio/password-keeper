import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:password_keeper/authentication/authentication.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/log_in_background.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              const Spacer(),
              GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.50,
                borderRadius: 40,
                blur: 25,
                alignment: Alignment.bottomCenter,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.5),
                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Text(
                        "Password keeper",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          fontSize: 30,
                        ),
                      ),
                      const Divider(thickness: 3),
                      const SizedBox(height: 90),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: _submitPassword,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () =>
                            _submitPassword(_passwordController.text),
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitPassword(String value) {
    context.read<AuthenticationBloc>().add(
          AuthenticateWithData(
            authenticationData: AuthenticationData(passCode: value),
          ),
        );
  }
}
