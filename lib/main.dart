import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';
import 'package:password_keeper/view/home/credentials_row.dart';
import 'package:password_keeper/view/home/top_caption.dart';

void main() {
  runApp(const PasswordKeeperApp());
}

class PasswordKeeperApp extends StatefulWidget {
  const PasswordKeeperApp({Key? key}) : super(key: key);

  @override
  State<PasswordKeeperApp> createState() => _PasswordKeeperAppState();
}

class _PasswordKeeperAppState extends State<PasswordKeeperApp> {
  // TODO: inject credentials
  List<Credentials> credentials = [
    Credentials(
        websiteURL: 'website1.com', login: 'login', passwordHash: 'pass1'),
    Credentials(
        websiteURL: 'website2.com', login: 'login', passwordHash: 'pass2'),
    Credentials(
        websiteURL: 'website3.com', login: 'login', passwordHash: 'pass3'),
    Credentials(
        websiteURL: 'website4.com', login: 'login', passwordHash: 'pass4'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Password Keeper'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const TopCaption(),
                Column(
                  children: credentials
                      .map((e) => CredentialsRow(
                            credentials: e,
                          ))
                      .toList(),
                ),
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
        bottomNavigationBar: BottomNavigationBar(
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
