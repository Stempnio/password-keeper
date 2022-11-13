import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/home/home.dart';
import 'package:password_keeper/sign_in/sign_in.dart';
import 'package:password_keeper/app/widgets/widgets.dart';
import 'package:password_keeper/settings/settings.dart';
import 'package:password_keeper/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          context.watch<ThemeCubit>().isDark ? AppTheme.dark : AppTheme.light,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/main',
      routes: {
        '/main': (context) => const AppView(),
        '/sign-in': (context) => const SignIn(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentScreen = 0;
  final screens = [
    const Home(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _currentScreen,
        children: screens,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(
                Icons.home,
                size: _iconSize(0),
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: Icon(
                Icons.settings,
                size: _iconSize(1),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const Fab(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  double _iconSize(int index) => _currentScreen == index ? 35 : 25;
}
