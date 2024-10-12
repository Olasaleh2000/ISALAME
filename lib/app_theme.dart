import 'package:flutter/material.dart';

class AppTheme {
  static const lightPrimary = Color(0xFFB7935F);
  static const white = Color(0xFFF8F8F8);
  static const darkPrimary = Color(0xFF141A2E);
  static const dark = Color(0xFF242424);
  static const gold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
      ),
      textTheme: TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)));

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: dark, // Background color for dark theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: Color(0xFFF8F8F8),
    ),
  );
}
