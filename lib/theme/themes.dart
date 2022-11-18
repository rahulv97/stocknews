import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.black,
    iconTheme: IconThemeData(color: leftgradient),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: bgimage,
    primaryColor: bgimage,
    iconTheme: IconThemeData(color: textColor),
    colorScheme: const ColorScheme.light(),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
