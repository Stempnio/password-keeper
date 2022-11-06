import 'package:credentials_repository/credentials_repository.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/credentials.dart';
import 'package:password_keeper/home/widgets/widgets.dart';

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
