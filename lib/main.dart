import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';
import 'package:password_keeper/repository/credentials_repository.dart';
import 'package:password_keeper/view/home/credentials_row.dart';
import 'package:password_keeper/view/home/top_caption.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const PasswordKeeperApp());
}

class PasswordKeeperApp extends StatefulWidget {
  const PasswordKeeperApp({Key? key}) : super(key: key);

  @override
  State<PasswordKeeperApp> createState() => _PasswordKeeperAppState();
}

class _PasswordKeeperAppState extends State<PasswordKeeperApp> {
  CredentialsRepository credentialsRepository = CredentialsRepository();
  bool loadingCredentials = true;

  void getCredentials() async {
    var result = await credentialsRepository.getCredentials();
    setState(() {
      credentials = result;
      loadingCredentials = false;
    });
  }

  List<Credentials> credentials = [];

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: ,
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit,
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
                loadingCredentials
                    ? Column(
                        children: [
                          const Text('Loading data'),
                          const SizedBox(
                            height: 30,
                          ),
                          LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.black, size: 70),
                        ],
                      )
                    : credentials.isEmpty
                        ? const Text('No passwords yet')
                        : Column(
                            children: credentials
                                .map(
                                  (e) => CredentialsRow(
                                    credentials: e,
                                    delete: () {
                                      setState(() {
                                        credentials.remove(e);
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                          ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          // TODO: sheet for adding credentials
          onPressed: () {
            setState(() {
              credentials.add(
                Credentials(
                    websiteURL: 'websiteNew.com',
                    login: 'login',
                    passwordHash: 'passNew'),
              );
            });
          },
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
