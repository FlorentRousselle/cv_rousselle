import 'package:cv_flutter/resources/color_resources.dart';
import 'package:flutter/material.dart';

///
/// DarkTheme
///
ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: ColorResources.blue,
      fontSize: 28,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: ColorResources.blue,
      fontSize: 18,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      color: ColorResources.white,
      fontSize: 18,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: ColorResources.white,
      fontSize: 13,
      fontFamily: "Garamond",
    ),
    bodyText1: TextStyle(
      color: ColorResources.white,
      fontSize: 13,
      fontFamily: "Garamond",
      fontStyle: FontStyle.italic,
    ),
    subtitle1: TextStyle(
      color: ColorResources.white,
      fontSize: 12,
      fontFamily: "Garamond",
    ),
    subtitle2: TextStyle(
      color: ColorResources.white,
      fontSize: 12,
      fontFamily: "Garamond",
      fontStyle: FontStyle.italic,
    ),
  ),
  iconTheme: const IconThemeData(color: ColorResources.blue),
  scaffoldBackgroundColor: ColorResources.black,
  backgroundColor: ColorResources.black,
  cardColor: ColorResources.grey,
  canvasColor: ColorResources.blueLight,
  appBarTheme: const AppBarTheme(backgroundColor: ColorResources.blueLight, elevation: 0),
  shadowColor: ColorResources.shadow,
);

///
/// LightTheme
///
ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: ColorResources.blueDark,
      fontSize: 36,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w600,
    ),
    headline2: TextStyle(
      color: ColorResources.blueDark,
      fontSize: 18,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      color: ColorResources.black,
      fontSize: 18,
      fontFamily: "Garamond",
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: ColorResources.black,
      fontSize: 13,
      fontFamily: "Garamond",
    ),
    bodyText1: TextStyle(
      color: ColorResources.black,
      fontSize: 13,
      fontFamily: "Garamond",
      fontStyle: FontStyle.italic,
    ),
    subtitle1: TextStyle(
      color: ColorResources.black,
      fontSize: 12,
      fontFamily: "Garamond",
    ),
    subtitle2: TextStyle(
      color: ColorResources.black,
      fontSize: 12,
      fontFamily: "Garamond",
      fontStyle: FontStyle.italic,
    ),
  ),
  iconTheme: const IconThemeData(color: ColorResources.blueDark),
  scaffoldBackgroundColor: ColorResources.white,
  backgroundColor: ColorResources.white,
  cardColor: ColorResources.blueLight,
  canvasColor: ColorResources.blueDark,
  appBarTheme: const AppBarTheme(backgroundColor: ColorResources.blueDark, elevation: 0),
  shadowColor: ColorResources.shadow,
);
