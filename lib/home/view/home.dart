import 'package:credentials_repository/credentials_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/bloc/credentials_bloc.dart';
import 'package:password_keeper/home/view/edit_credentials.dart';
import 'package:password_keeper/home/view/edit_credentials_route.dart';
import 'package:password_keeper/credentials/view/credentials_row.dart';
import 'package:password_keeper/home/widgets/loading_widget.dart';
import 'package:password_keeper/home/widgets/top_caption.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CredentialsBloc, CredentialsState>(
      builder: (context, state) {
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
                    context.read<CredentialsBloc>().add(CredentialsFetched());
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
            child: state.status == CredentialsStatus.failure
                ? errorWidget()
                : Center(
                    child: Column(
                      children: [
                        const TopCaption(),
                        state.status == CredentialsStatus.loading
                            ? const LoadingWidget()
                            : state.credentials.isEmpty
                                ? const Text('No passwords yet')
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: state.credentials.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onLongPress: () {
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (_) => actionSheet(
                                                  state.credentials[index],
                                                  index),
                                            );
                                          },
                                          child: CredentialsRow(
                                            credentials:
                                                state.credentials[index],
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
            onPressed: () {
              Navigator.push(
                context,
                EditCredentialsRoute(
                  builder: (context) => EditCredentials(
                    inputCredentials: const Credentials(
                        login: "", passwordHash: "", websiteURL: ""),
                    actionHandler: (credentials) {
                      context.read<CredentialsBloc>().add(
                            CredentialsAdded(
                              credentials: credentials,
                            ),
                          );
                    },
                  ),
                ),
              );
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
      },
    );
  }

  Widget actionSheet(Credentials credentials, int? index) {
    return CupertinoActionSheet(
      // title: Text(_credentials[index].websiteURL),

      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            Navigator.push(
              context,
              EditCredentialsRoute(
                builder: (context) => EditCredentials(
                  inputCredentials: credentials,
                  actionHandler: (editedCredentials) {
                    context.read<CredentialsBloc>().add(
                          CredentialsEdited(
                            index: index ?? -1,
                            credentials: editedCredentials,
                          ),
                        );
                  },
                ),
              ),
            );
          },
          child: const Text("Edit"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop(); // dismiss action sheet
            context
                .read<CredentialsBloc>()
                .add(CredentialsDeleted(credentials: credentials));
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
