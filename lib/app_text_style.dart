import 'package:flutter/material.dart';

/// App text style define in app
///
/// use it when you want to change the style of a specific text
/// Can be customized to adapt any other app theme
class AppTextStyle {
  /// font family of application
  static const String fontFamily = "Ubuntu";

  /// display medium style
  static TextStyle _displayMedium(Color color) {
    return TextStyle(
      debugLabel: 'displayMedium',
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// display small style
  static TextStyle _displaySmall(Color color) {
    return TextStyle(
      debugLabel: 'displaySmall',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// headline medium style
  static TextStyle _headlineMedium(Color color) {
    return TextStyle(
      debugLabel: 'headlineMedium',
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// headline small style
  static TextStyle _headlineSmall(Color color) {
    return TextStyle(
      debugLabel: 'headlineSmall',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// title medium style
  static TextStyle _titleMedium(Color color) {
    return TextStyle(
      debugLabel: 'titleMedium',
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// title small style
  static TextStyle _titleSmall(Color color) {
    return TextStyle(
      debugLabel: 'titleSmall',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// body medium style
  static TextStyle _bodyMedium(Color color) {
    return TextStyle(
      debugLabel: 'bodyMedium',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// body small style
  static TextStyle _bodySmall(Color color) {
    return TextStyle(
      debugLabel: 'bodySmall',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// label medium style
  static TextStyle _labelMedium(Color color) {
    return TextStyle(
      debugLabel: 'labelMedium',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// label small style
  static TextStyle _labelSmall(Color color) {
    return TextStyle(
      debugLabel: 'labelSmall',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// [getTextTheme] Get the text theme for the application
  ///
  /// Create the style before adding them in this function
  ///
  /// parameters:
  /// [textColor] : text color
  static TextTheme getTextTheme({required Color textColor}) {
    return TextTheme(
      displayMedium: _displayMedium(textColor),
      displaySmall: _displaySmall(textColor),
      headlineMedium: _headlineMedium(textColor),
      headlineSmall: _headlineSmall(textColor),
      titleMedium: _titleMedium(textColor),
      titleSmall: _titleSmall(textColor),
      bodyMedium: _bodyMedium(textColor),
      bodySmall: _bodySmall(textColor),
      labelMedium: _labelMedium(textColor),
      labelSmall: _labelSmall(textColor),
    );
  }
}
