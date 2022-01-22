import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
        headline3: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.white70, fontSize: 14, fontFamily: "Garamond")),
    iconTheme: const IconThemeData(color: Colors.white70),
    appBarTheme: const AppBarTheme(color: Colors.black12, elevation: 0),
    shadowColor: Colors.white38,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black12));

ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
        headline3: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontFamily: "Garamond",
            fontWeight: FontWeight.w500),
        subtitle1: TextStyle(
            color: Colors.black87, fontSize: 14, fontFamily: "Garamond")),
    iconTheme: const IconThemeData(color: Colors.black87),
    appBarTheme: const AppBarTheme(color: Colors.black12, elevation: 0),
    shadowColor: Colors.black38,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black87));
