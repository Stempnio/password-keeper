import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_keeper/authentication/authentication.dart';
import 'package:password_keeper/home/home.dart';
import 'package:password_keeper/settings/settings.dart';
import 'package:password_keeper/theme/theme.dart';
import 'package:password_keeper/app/widgets/widgets.dart';

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
      home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Authentication failed!"),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: IndexedStack(
                index: currentScreen,
                children: screens,
              ),
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                animationDuration: const Duration(milliseconds: 200),
                color: Colors.black26,
                index: currentScreen,
                onTap: (index) => setState(() {
                  currentScreen = index;
                }),
                items: const [
                  Icon(Icons.home),
                  Icon(Icons.settings),
                ],
              ),
              floatingActionButton: const Fab(),
            );
          } else {
            return const LogInPage();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
