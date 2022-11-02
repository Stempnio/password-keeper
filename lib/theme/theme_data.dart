import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffF5F5FB),
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.lightGreenAccent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class AppColor {
  static const black = Color(0xff000000);

  static const milk = Color(0xffDFDFDF);
  static const white = Color(0xffFFFFFF);
  static const whiteSmoke = Color(0xffF6F6F6);

  static const blue = Color(0xff016CF6);
  static const lightBlue = Color.fromARGB(255, 135, 167, 255);

  static const red = Color(0xffFF0000);

  static const lightGreen = Color(0xff67C000);

  static const cosmos = Color(0xffCCCCCC);
  static const pink = Color.fromARGB(255, 227, 33, 98);

  static const brown = Color(0xff4E4E4E);

  static const whiteScaffoldBackground = Color(0xffF5F5FB);
  static const violet = Color(0xff435B96);

  static const grey = Color(0xff8B8B8B);
  static const darkGrey = Color(0xff707070);
  static const veryDarkGrey = Color(0xff565656);
  static const lightGrey = Color(0xffCBCBCB);

  static const orange = Color(0xffFFAA00);
}
