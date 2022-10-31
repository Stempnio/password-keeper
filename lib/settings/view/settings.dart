import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/authentication/authentication.dart';
import 'package:password_keeper/reused_widgets/card_icon.dart';
import 'package:password_keeper/reused_widgets/set_passcode_page.dart';

import 'package:password_keeper/theme/theme_cubit.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Dark mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: themeCubit.isDark,
                    onChanged: (newValue) {
                      context.read<ThemeCubit>().toggleThemeMode();
                    },
                  ),
                ],
              ),
              const Divider(),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    CardIcon(
                      text: "Change PIN",
                      icon: Icons.lock,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SetPasscodePage()),
                        );
                      },
                    ),
                    CardIcon(
                      text: "Log out",
                      icon: Icons.logout,
                      onTap: () {
                        context.read<AuthenticationBloc>().add(LogOut());
                      },
                    ),
                    CardIcon(
                      text: "Notifications",
                      icon: Icons.notifications,
                      onTap: () {},
                    ),
                    CardIcon(
                      text: "Privacy",
                      icon: Icons.privacy_tip_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
