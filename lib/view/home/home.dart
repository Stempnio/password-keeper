import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_keeper/model/credentials.dart';
import 'package:password_keeper/repository/credentials_repository.dart';
import 'package:password_keeper/theme/theme_manager.dart';
import 'package:password_keeper/utils/credentials_utils.dart';
import 'package:password_keeper/view/home/edit_credentials.dart';
import 'package:password_keeper/view/home/edit_credentials_route.dart';
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

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void getCredentials() async {
    try {
      List<Credentials> result = await credentialsRepository.getCredentials();
      setState(() {
        // TODO: temporary - deep cloning the array
        _credentials = [];
        _credentials = [...result];
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
  List<Credentials> _credentials = [];

  @override
  void initState() {
    ThemeManager().addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text('Password Keeper'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: Ink(
                child: const Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: loadingError
            ? errorWidget()
            : Center(
                child: Column(
                  children: [
                    const TopCaption(),
                    loadingCredentials
                        ? loadingWidget()
                        : _credentials.isEmpty
                            ? const Text('No passwords yet')
                            : Expanded(
                                child: AnimatedList(
                                  key: _listKey,
                                  initialItemCount: _credentials.length,
                                  itemBuilder: (context, index, animation) {
                                    return SlideTransition(
                                      position: animation.drive(
                                        Tween(
                                          begin: Offset(1, 0),
                                          end: Offset(0, 0),
                                        ),
                                      ),
                                      child: InkWell(
                                        onLongPress: () {
                                          showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) =>
                                                actionSheet(index),
                                          );
                                        },
                                        child: CredentialsRow(
                                          credentials: _credentials[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_credentials',
        // backgroundColor: Colors.blueAccent,
        onPressed: () {
          openEditCredentialsMenu(addCredentials, emptyCredentials());
        },
        icon: const Icon(Icons.add),
        label: const Text(
          'Add',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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

  void openEditCredentialsMenu(Function action, Credentials credentials) {
    Navigator.push(
      context,
      EditCredentialsRoute(
        builder: (context) => EditCredentials(
          actionHandler: action,
          credentials: credentials,
        ),
      ),
    );
  }

  void deleteCredentials(int index) {
    final removedCredentials = _credentials[index];

    setState(() {
      credentialsRepository
          .deleteCredentials(removedCredentials); // TODO: deleting by index?
      _credentials.removeAt(index);
    });
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
          sizeFactor: animation.drive(Tween<double>(begin: 0, end: 1)),
          child: CredentialsRow(credentials: removedCredentials)),
    );
  }

  void addCredentials(Credentials newCredentials) {
    credentialsRepository.addCredentials(newCredentials);
    setState(() {
      _credentials.add(newCredentials);
    });
    _listKey.currentState?.insertItem(_credentials.length - 1);
  }

  void editCredentials(Credentials editedCredentials, int index) {
    credentialsRepository.modifyCredentials(index, editedCredentials);
    setState(() {
      _credentials[index] = editedCredentials;
    });
  }

  Widget actionSheet(int index) {
    return CupertinoActionSheet(
      title: Text(_credentials[index].websiteURL),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            openEditCredentialsMenu(
                (Credentials editedCredentials) =>
                    editCredentials(editedCredentials, index),
                _credentials[index]);
          },
          child: const Text("Edit"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            deleteCredentials(index);
          },
          isDestructiveAction: true,
          child: const Text("Delete credentials"),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(), // dismiss action sheet,
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
        LoadingAnimationWidget.staggeredDotsWave(
          color: ThemeManager().themeMode == ThemeMode.light
              ? Colors.blueAccent
              : Colors.white,
          size: 70,
        ),
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
