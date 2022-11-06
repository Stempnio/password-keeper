import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/credentials.dart';

class CredentialsPage extends StatelessWidget {
  const CredentialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialsBloc, CredentialsState>(
      builder: (context, state) {
        if (state.status == CredentialsStatus.loading) {
          return const LoadingWidget();
        } else {
          if (state.credentials.isEmpty) {
            return const NoCredentialsAdded();
          } else {
            return _CredentialsView(credentials: state.credentials);
          }
        }
      },
      listener: (context, state) {
        if (state.status == CredentialsStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Error has occurred'),
              ),
            );
        }
      },
    );
    // return BlocBuilder<CredentialsBloc, CredentialsState>(
    //     builder: (context, state) {
    //   if (state.status == CredentialsStatus.failure) {
    //     return const CredentialsError();
    //   } else if (state.status == CredentialsStatus.loading) {
    //     return const LoadingWidget();
    //   } else {
    //     if (state.credentials.isEmpty) {
    //       return const NoCredentialsAdded();
    //     } else {
    //       return _CredentialsView(credentials: state.credentials);
    //     }
    //   }
    // });
  }
}

class _CredentialsView extends StatelessWidget {
  const _CredentialsView({Key? key, required this.credentials})
      : super(key: key);

  final List<Credentials> credentials;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: credentials.length,
      itemBuilder: (context, index) {
        var separator = index == 0 ||
                credentials[index - 1].websiteURL[0] !=
                    credentials[index].websiteURL[0]
            ? LetterSeparator(
                letter: credentials[index].websiteURL[0].toUpperCase(),
              )
            : Container();
        return Column(
          children: [
            separator,
            InkWell(
              onLongPress: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => CredentialsActionSheet(
                    credentials: credentials[index],
                    index: index,
                  ),
                );
              },
              child: CredentialsRow(
                credentials: credentials[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
