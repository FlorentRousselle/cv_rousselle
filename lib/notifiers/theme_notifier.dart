import 'package:cv_flutter/ThemeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) {
  return ThemeNotifier();
});


class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = darkTheme;

  ThemeNotifier();

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  swapTheme() async {
    _themeData == lightTheme ? setTheme(darkTheme) : setTheme(lightTheme);
  }
}