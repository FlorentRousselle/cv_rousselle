import 'package:cv_flutter/ThemeData.dart';
import 'package:flutter/material.dart';

///
/// Control for theme in app
/// Change theme and notify application when changed
/// (use with provider)
///
class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  swapTheme() async {
    _themeData == lightTheme ? setTheme(darkTheme) : setTheme(lightTheme);
  }
}