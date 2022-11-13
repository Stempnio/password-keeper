import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/reused_widgets/card_icon.dart';

import 'package:password_keeper/theme/cubit/theme_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Dark mode",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    text: "Profile",
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            appBar: AppBar(
                              title: const Text("Profile"),
                            ),
                            actions: [
                              SignedOutAction((context) {
                                Navigator.pushReplacementNamed(
                                    context, '/sign-in');
                              })
                            ],
                          ),
                        ),
                      );
                    },
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
    );
  }
}
