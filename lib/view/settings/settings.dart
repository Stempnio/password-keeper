import 'package:flutter/material.dart';
import 'package:password_keeper/theme/theme_manager.dart';
import 'package:password_keeper/view/common/card_icon.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ThemeManager().addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    value: ThemeManager().themeMode == ThemeMode.dark,
                    onChanged: (newValue) {
                      ThemeManager().toggleThemeMode(!newValue);
                    },
                  ),
                ],
              ),
              const Divider(),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    CardIcon(
                      text: "Change PIN",
                      icon: Icons.lock,
                    ),
                    CardIcon(
                      text: "Privacy",
                      icon: Icons.privacy_tip_rounded,
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
