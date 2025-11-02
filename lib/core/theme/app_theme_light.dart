import 'package:expense_tracker/core/theme/app_light_theme_color.dart';
import 'package:expense_tracker/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

/// Light mode color scheme using all Material 3 roles.
class AppThemeLight {
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppLightThemeColors.primary,
    onPrimary: AppLightThemeColors.onPrimary,
    primaryContainer: AppLightThemeColors.primaryContainer,
    onPrimaryContainer: AppLightThemeColors.onPrimaryContainer,
    secondary: AppLightThemeColors.secondary,
    onSecondary: AppLightThemeColors.onSecondary,
    secondaryContainer: AppLightThemeColors.secondaryContainer,
    onSecondaryContainer: AppLightThemeColors.onSecondaryContainer,
    tertiary: AppLightThemeColors.tertiary,
    onTertiary: AppLightThemeColors.onTertiary,
    tertiaryContainer: AppLightThemeColors.tertiaryContainer,
    onTertiaryContainer: AppLightThemeColors.onTertiaryContainer,
    error: AppLightThemeColors.error,
    onError: AppLightThemeColors.onError,
    errorContainer: AppLightThemeColors.errorContainer,
    onErrorContainer: AppLightThemeColors.onErrorContainer,
    surfaceContainerHighest: AppLightThemeColors.onSurface,   // onBackground deprecated in favor of surfaceContainerHighest
    surface: AppLightThemeColors.surface,
    onSurface: AppLightThemeColors.onSurface,     // background deprecated in favor of onSurface
    surfaceVariant: AppLightThemeColors.surfaceContainer,
    onSurfaceVariant: AppLightThemeColors.onSurfaceVariant,
    outline: AppLightThemeColors.outline,
    outlineVariant: AppLightThemeColors.outlineVariant,
    inverseSurface: AppLightThemeColors.inverseSurface,
    onInverseSurface: AppLightThemeColors.inverseOnSurface,
    inversePrimary: AppLightThemeColors.inversePrimary,
    shadow: AppLightThemeColors.shadow,
    scrim: AppLightThemeColors.scrim,
  );

  /// Complete ThemeData for the light theme.
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppLightThemeColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppLightThemeColors.surface,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppLightThemeColors.onSurface),
      titleTextStyle: TextStyle(
        color: AppLightThemeColors.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppLightThemeColors.onPrimary),
        backgroundColor: WidgetStatePropertyAll(AppLightThemeColors.primary),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppLightThemeColors.onSurfaceVariant,
      size: 22,
    ),
    cardTheme: const CardThemeData(
      color: AppLightThemeColors.surfaceContainerLow,
      elevation: 0,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppLightThemeColors.surfaceContainerLowest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppLightThemeColors.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppLightThemeColors.primary, width: 1.5),
      ),
      labelStyle: const TextStyle(color: AppLightThemeColors.onSurfaceVariant),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppLightThemeColors.primary,
      foregroundColor: AppLightThemeColors.onPrimary,
      elevation: 3,
    ),
    dividerColor: AppLightThemeColors.outlineVariant,
    textTheme: AppTextTheme.lightTextTheme,
  );
}
