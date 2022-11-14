import 'package:flutter/material.dart';
import 'package:password_keeper/credentials/credentials.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: CredentialsPage(),
        ),
      ),
    );
  }
}
