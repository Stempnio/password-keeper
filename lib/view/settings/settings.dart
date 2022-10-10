import 'package:flutter/material.dart';
import 'package:password_keeper/theme/theme_manager.dart';

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
              const Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter new nickname',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nickname can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter new password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Success')),
                            );
                          }
                        },
                        child: const Text('submit'),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
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
            ],
          ),
        ),
      ),
    );
  }
}
