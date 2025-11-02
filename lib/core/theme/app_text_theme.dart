import 'package:expense_tracker/core/theme/app_light_theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized text styles for your app.
/// You can use this for both light & dark themes.
class AppTextTheme {
  static TextTheme get lightTextTheme => TextTheme(
    displayLarge: GoogleFonts.getFont(
      'Outfit',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppLightThemeColors.tertiary,
    ),
    displayMedium: GoogleFonts.getFont(
      'Outfit',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppLightThemeColors.tertiary,
    ),
    displaySmall: GoogleFonts.getFont(
      'Outfit',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppLightThemeColors.tertiary,
    ),
    titleLarge: GoogleFonts.getFont(
      'Outfit',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppLightThemeColors.tertiary,
    ),
    titleMedium: GoogleFonts.getFont(
      'Outfit',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppLightThemeColors.tertiary,
    ),
    titleSmall: GoogleFonts.getFont(
      'Outfit',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppLightThemeColors.tertiary,
    ),
    bodyLarge: GoogleFonts.getFont(
      'Outfit',
      fontSize: 16,
      color: AppLightThemeColors.tertiary,
    ),
    bodyMedium: GoogleFonts.getFont(
      'Outfit',
      fontSize: 14,
      color: AppLightThemeColors.tertiary,
    ),
    bodySmall: GoogleFonts.getFont(
      'Outfit',
      fontSize: 12,
      color: AppLightThemeColors.tertiary.withOpacity(0.6),
    ),
    labelLarge: GoogleFonts.getFont(
      'Outfit',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppLightThemeColors.primary,
    ),
    labelMedium: GoogleFonts.getFont(
      'Outfit',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppLightThemeColors.primary,
    ),
    labelSmall: GoogleFonts.getFont(
      'Outfit',
      fontSize: 10,
      color: AppLightThemeColors.onSurfaceVariant,
    ),
  );

  /// You can also define dark theme typography easily later.
  static TextTheme get darkTextTheme => lightTextTheme.apply(
    bodyColor: AppLightThemeColors.tertiary,
    displayColor: AppLightThemeColors.tertiary,
  );
}
