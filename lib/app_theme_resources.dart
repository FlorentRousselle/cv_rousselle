import 'package:cv_flutter/app_text_style.dart';
import 'package:cv_flutter/models/color_theme_model.dart';
import 'package:flutter/material.dart';

/// App Theme
class AppThemeResources {
  /// App theme
  ///
  /// parameters :
  /// [colorTheme] : app color theme
  static ThemeData getTheme({
    required ColorThemeModel colorTheme,
  }) =>
      ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: colorTheme.primary,
        primaryColorLight: colorTheme.white,
        secondaryHeaderColor: colorTheme.secondary,
        scaffoldBackgroundColor: colorTheme.background,
        textTheme: AppTextStyle.getTextTheme(textColor: colorTheme.text),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: colorTheme.text),
        ),
        iconTheme: IconThemeData(color: colorTheme.primary),
        buttonTheme: const ButtonThemeData(alignedDropdown: true),
      );
}
