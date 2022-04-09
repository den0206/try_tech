import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _cutsomTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _cutsomTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _cutsomTheme = false;
    _darkTheme = value;
    _currentTheme = value ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool value) {
    _cutsomTheme = value;
    _darkTheme = false;
    _currentTheme = value ? ThemeData.light() : ThemeData.light();
    notifyListeners();
  }
}
