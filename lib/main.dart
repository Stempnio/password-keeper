import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';

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
                const TopWidget(),
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

class CredentialsRow extends StatefulWidget {
  final Credentials credentials;

  const CredentialsRow({required this.credentials, Key? key}) : super(key: key);

  @override
  State<CredentialsRow> createState() => _CredentialsRowState();
}

class _CredentialsRowState extends State<CredentialsRow> {
  bool showingPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.credentials.websiteURL,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            if (showingPassword)
              Text(widget.credentials.passwordHash)
            else
              const Text('*********'),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (showingPassword) {
                    showingPassword = false;
                  } else {
                    showingPassword = true;
                  }
                });
              },
              icon: Icon(
                showingPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
