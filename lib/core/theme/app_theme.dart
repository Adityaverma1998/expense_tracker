import 'package:expense_tracker/core/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

/// Global theme handler (light + dark ready)
class AppTheme {
  static ThemeData get light => AppThemeLight.themeData;

  // Dark theme placeholder (can be added later)
  // static ThemeData get dark => AppThemeLight.themeData.copyWith(
  //   brightness: Brightness.dark,
  // );

  static ThemeMode get themeMode => ThemeMode.system;
}
