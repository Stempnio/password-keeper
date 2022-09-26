import 'package:flutter/material.dart';
import 'package:password_keeper/view/home/home.dart';
import 'package:password_keeper/view/settings/settings.dart';

void main() {
  runApp(const PasswordKeeperApp());
}

class PasswordKeeperApp extends StatefulWidget {
  const PasswordKeeperApp({Key? key}) : super(key: key);

  @override
  State<PasswordKeeperApp> createState() => _PasswordKeeperAppState();
}

class _PasswordKeeperAppState extends State<PasswordKeeperApp> {
  int currentScreen = 0;
  final screens = [
    const Home(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: currentScreen,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (index) => setState(() {
            currentScreen = index;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
