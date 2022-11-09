import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:credentials_service/credentials_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/credentials/credentials.dart';
import 'package:password_keeper/credentials/view/credentials_list.dart';
import 'package:password_keeper/theme/cubit/theme_cubit.dart';

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: AnimSearchBar(
              rtl: true,
              color: context.watch<ThemeCubit>().isDark
                  ? const Color(0xff414348)
                  : Colors.white,
              style: const TextStyle(),
              width: MediaQuery.of(context).size.width * 0.8,
              textController: _textController,
              onSuffixTap: () => setState(() {
                    _textController.clear();
                  })),
        ),
        Expanded(
          child: CredentialsList(
            credentials: filteredCredentials,
          ),
        ),
      ],
    );
  }
}
