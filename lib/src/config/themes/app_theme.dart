import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFC300); // Amarillo Geoxus
  static const Color dark = Color(0xFF34332F); // Gris oscuro Geoxus
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.dark,
    foregroundColor: AppColors.white,
    elevation: 0,
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    background: AppColors.dark,
    surface: AppColors.dark,
    onPrimary: AppColors.black,
    onSecondary: AppColors.black,
    onBackground: AppColors.white,
    onSurface: AppColors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.white),
    displayMedium: TextStyle(color: AppColors.white),
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: AppColors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.primary),
      foregroundColor: MaterialStatePropertyAll(AppColors.black),
      textStyle:
          MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  ),
);
