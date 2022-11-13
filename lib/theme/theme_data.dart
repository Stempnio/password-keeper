import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_keeper/theme/app_color.dart';

class AppTheme {
  static ThemeData get light => _commonTheme(dark: false);

  static ThemeData get dark => _commonTheme(dark: true).copyWith(
        listTileTheme: ListTileThemeData(
          iconColor: AppColors.darkGrey,
          tileColor: AppColors.milk,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        scaffoldBackgroundColor: AppColors.darkGrey,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.darkGrey,
          ),
          titleMedium: TextStyle(
            color: AppColors.milk,
          ),
        ),
        cardColor: AppColors.deepBlue,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.lightBlue,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      );

  static ThemeData _commonTheme({required bool dark}) {
    return ThemeData(
      brightness: dark ? Brightness.dark : Brightness.light,
      fontFamily: GoogleFonts.lato().fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
