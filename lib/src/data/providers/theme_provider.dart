import 'package:flutter/material.dart';
import 'package:geoxus_web/src/config/themes/app_theme.dart';
import 'package:geoxus_web/src/data/shared/share_preferences.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemesProvider()
      : currentTheme =
            Preferences.isDarkmode ? AppThemes.darkTheme : AppThemes.lightTheme;

  void setLightMode() {
    currentTheme = AppThemes.lightTheme;
    Preferences.setDarkmode(false);
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = AppThemes.darkTheme;
    Preferences.setDarkmode(true);
    notifyListeners();
  }
}
