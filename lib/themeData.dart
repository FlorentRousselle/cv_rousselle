import 'package:flutter/material.dart';

///
/// DarkTheme
///
ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
        headline1: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w700),
        bodyText2: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.white70, fontSize: 14, fontFamily: "Garamond"),
        subtitle2: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: "Garamond",
            fontStyle: FontStyle.italic),
        button: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500)),
    iconTheme: const IconThemeData(color: Colors.white70),
    appBarTheme: const AppBarTheme(color: Colors.black12, elevation: 0),
    shadowColor: Colors.white38,
    popupMenuTheme: PopupMenuThemeData(color: Colors.grey[200]),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black12));

///
/// LightTheme
///
ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
        headline1: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w700),
        bodyText2: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.black87, fontSize: 14, fontFamily: "Garamond"),
        subtitle2: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontFamily: "Garamond",
            fontStyle: FontStyle.italic),
        button: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500)),
    iconTheme: const IconThemeData(color: Colors.black54),
    appBarTheme: const AppBarTheme(color: Colors.black12, elevation: 0),
    shadowColor: Colors.black38,
    popupMenuTheme: PopupMenuThemeData(color: Colors.grey[700]),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black12));
