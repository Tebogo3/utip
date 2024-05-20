import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  //private instance or field
  bool _isDarkMode = false;

  //getters

  bool get isDarkMode => _isDarkMode;

  //Methods to toggle between light and dark mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  //get current theme mode
  ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
