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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
