import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Password Keeper'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: const [
                TopWidget(),
                PasswordRow(),
                PasswordRow(),
                PasswordRow(),
                PasswordRow(),
                PasswordRow(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
        drawer: Drawer(
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
                  onPressed: () {},
                  child: const Text('log out'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Passwords are safe with us',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Give them to us',
          style: TextStyle(
            color: Colors.grey,
            letterSpacing: 3,
          ),
        ),
        Divider(
          thickness: 2,
          height: 20,
        ),
      ],
    );
  }
}

class PasswordRow extends StatelessWidget {
  const PasswordRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'website.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text('*********'),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.visibility,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
