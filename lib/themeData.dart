import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xff1f655d),
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white, fontFamily: "PalanquinDark"),
      subtitle1: TextStyle(color: Colors.white)),
  appBarTheme: const AppBarTheme(color: Color(0xff1f655d)),
);

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xfff5f5f5),
    textTheme: const TextTheme(
        bodyText1:
            TextStyle(color: Colors.black, fontFamily: "ShadowsIntoLightTwo"),
        subtitle1: TextStyle(color: Colors.grey)),
    appBarTheme: const AppBarTheme(
        color: Colors.white12,
        actionsIconTheme: IconThemeData(color: Colors.white)));
