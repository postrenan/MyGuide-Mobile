import 'package:flutter/material.dart';

class ThemeType {
  static const lightMode = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFFF0000),
    onError: Color(0xFFFF0000),
    surface: Color(0xFFE8E8E8),
    onSurface: Color(0xFF3F3F3F)
  );

  static const darkMode = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFFF0000),
    onError: Color(0xFFFF0000),
    surface: Color(0xFF333333),
    onSurface: Color(0xFFFFFFFF)
  );
}
