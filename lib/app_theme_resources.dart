import 'package:cv_flutter/app_text_style.dart';
import 'package:cv_flutter/models/color_theme_model.dart';
import 'package:flutter/material.dart';

/// App Theme
class AppThemeResources {
  /// App theme
  ///
  /// parameters :
  /// [colorTheme] : app color theme
  static ThemeData getTheme({required ColorThemeModel colorTheme}) =>
      ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: colorTheme.primary,
        primaryColorLight: colorTheme.white,
        secondaryHeaderColor: colorTheme.secondary,
        scaffoldBackgroundColor: colorTheme.background,
        textTheme: AppTextStyle.getTextTheme(textColor: colorTheme.text),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colorTheme.primary,
          onPrimary: colorTheme.primary,
          secondary: colorTheme.secondary,
          onSecondary: colorTheme.secondary,
          error: colorTheme.error ?? Colors.red,
          onError: colorTheme.error ?? Colors.red,
          surface: colorTheme.background,
          onSurface: colorTheme.background,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: colorTheme.text),
        ),
        iconTheme: IconThemeData(color: colorTheme.primary),
        buttonTheme: ButtonThemeData(
          alignedDropdown: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      );
}
