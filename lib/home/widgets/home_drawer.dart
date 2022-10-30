import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/authentication/authentication.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Hello user!',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(LogOut());
              },
              child: const Text('log out'),
            )
          ],
        ),
      ),
    );
  }
}
