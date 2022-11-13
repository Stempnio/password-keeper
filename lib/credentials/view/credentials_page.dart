import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/credentials.dart';
import 'package:password_keeper/credentials/view/credentials_list.dart';

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
  }
}

class _CredentialsView extends StatefulWidget {
  const _CredentialsView({Key? key, required this.credentials})
      : super(key: key);

  final List<Credentials> credentials;

  @override
  State<_CredentialsView> createState() => _CredentialsViewState();
}

class _CredentialsViewState extends State<_CredentialsView> {
  final _textController = TextEditingController();

  List<Credentials> filteredCredentials = [];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    filteredCredentials = widget.credentials;
    _textController.addListener(() {
      _filterCredentials(_textController.text);
    });
    super.initState();
  }

  void _filterCredentials(String pattern) {
    setState(() {
      filteredCredentials = widget.credentials
          .where((c) => c.websiteURL.startsWith(pattern))
          .toList();
    });
  }

  @override
  void didUpdateWidget(covariant _CredentialsView oldWidget) {
    if (oldWidget.credentials != widget.credentials) {
      _filterCredentials(_textController.text);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Image.asset("assets/images/app-logo.png"),
              const Spacer(),
              AnimSearchBar(
                  rtl: true,
                  color: Colors.grey,
                  style: const TextStyle(),
                  width: MediaQuery.of(context).size.width * 0.7,
                  textController: _textController,
                  onSuffixTap: () => setState(() {
                        _textController.clear();
                      })),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: CredentialsList(
            credentials: filteredCredentials,
          ),
        ),
      ],
    );
  }
}
