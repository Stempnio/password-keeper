import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/home/home.dart';
import 'package:password_keeper/settings/settings.dart';
import 'package:password_keeper/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentScreen = 0;
  final screens = [
    const Home(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      theme: themeCubit.isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: IndexedStack(
          index: currentScreen,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreen,
          onTap: (index) => setState(() {
            currentScreen = index;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
