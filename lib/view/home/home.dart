import 'package:flutter/material.dart';
import 'package:password_keeper/model/Credentials.dart';
import 'package:password_keeper/repository/credentials_repository.dart';
import 'package:password_keeper/view/home/credentials_row.dart';
import 'package:password_keeper/view/home/top_caption.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CredentialsRepository credentialsRepository = CredentialsRepository();
  bool loadingCredentials = true;
  bool loadingError = false;

  void getCredentials() async {
    try {
      List<Credentials> result = await credentialsRepository.getCredentials();
      setState(() {
        // TODO: temporary - deep cloning the array
        credentials = [];
        credentials = [...result];
        loadingCredentials = false;
        loadingError = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        loadingError = true;
      });
    }
  }

  // cached credentials
  List<Credentials> credentials = [];

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {
                setState(() {
                  loadingCredentials = true;
                  loadingError = false;
                });
                getCredentials();
              },
              child: const Icon(
                Icons.refresh,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: loadingError
            ? errorWidget()
            : Center(
                child: Column(
                  children: [
                    const TopCaption(),
                    loadingCredentials
                        ? loadingWidget()
                        : credentials.isEmpty
                            ? const Text('No passwords yet')
                            : Column(
                                children: credentials
                                    .map(
                                      (e) => CredentialsRow(
                                        credentials: e,
                                        delete: () {
                                          setState(() {
                                            credentialsRepository
                                                .deleteCredentials(e);
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
          Credentials newCredentials = Credentials(
              websiteURL: 'websiteNew.com',
              login: 'login',
              passwordHash: 'passNew');

          credentialsRepository.addCredentials(newCredentials);
          setState(() {
            credentials.add(newCredentials);
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
    );
  }

  Widget loadingWidget() {
    return Column(
      children: [
        const Text(
          'Loading data, please wait',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        LoadingAnimationWidget.staggeredDotsWave(color: Colors.black, size: 70),
      ],
    );
  }

  Widget errorWidget() {
    return Column(
      children: const [
        Text(
          'Error while downloading data, please try again',
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
