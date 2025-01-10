import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "OpenSans",
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffc300), brightness: Brightness.light),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ));
  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "OpenSans",
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffffc300),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1A1A1D),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xffc300),
      ));
}
