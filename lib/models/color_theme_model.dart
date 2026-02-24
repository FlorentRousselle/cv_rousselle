import 'dart:ui';

import 'package:flutter/material.dart';

class ColorThemeModel {
  ColorThemeModel({
    required this.primary,
    required this.secondary,
    required this.text,
    required this.disable,
    required this.background,
    this.error,
    this.success,
    this.white,
  });

  /// primary color
  Color primary;

  /// primary color
  Color secondary;

  /// text color
  Color text;

  /// disable item color (button, icon...)
  Color disable;

  /// background color
  Color background;

  /// error color
  Color? error = Colors.red.shade900;

  /// success color
  Color? success = Colors.green.shade900;

  /// white color
  Color? white = Colors.white;
}
