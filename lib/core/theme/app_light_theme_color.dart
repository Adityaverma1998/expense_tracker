import 'dart:ui';

/// AppColor holds all color roles from the Material 3 color system.
/// These values can be mapped to ThemeData.colorScheme for a fully
/// consistent light theme across the app.
class AppLightThemeColors {
  // =========================
  // 🌈 PRIMARY COLORS
  // =========================
  /// Main brand color (used for FABs, active buttons, etc.)
  static const Color primary = Color(0xFF6750A4);

  /// Text/icon color on top of [primary]
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Background color for containers using primary tone
  static const Color primaryContainer = Color(0xFFEADDFF);

  /// Text/icon color on top of [primaryContainer]
  static const Color onPrimaryContainer = Color(0xFF21005D);

  /// Used for dynamic color system (fixed primary shade)
  static const Color primaryFixed = Color(0xFFD0BCFF);

  /// Slightly dimmed version of [primaryFixed]
  static const Color primaryFixedDim = Color(0xFFB69DF8);

  /// Text/icon color on fixed primary tones
  static const Color onPrimaryFixed = Color(0xFF21005D);

  /// Variant for text/icons with less contrast
  static const Color onPrimaryFixedVariant = Color(0xFF4F378B);

  // =========================
  // 💜 SECONDARY COLORS
  // =========================
  /// Secondary brand/accent color
  static const Color secondary = Color(0xFF625B71);

  /// Text/icon on [secondary]
  static const Color onSecondary = Color(0xFFFFFFFF);

  /// Container background for secondary tone
  static const Color secondaryContainer = Color(0xFFE8DEF8);

  /// Text/icon on [secondaryContainer]
  static const Color onSecondaryContainer = Color(0xFF1D192B);

  /// Dynamic color fixed tone
  static const Color secondaryFixed = Color(0xFFCCC2DC);
  static const Color secondaryFixedDim = Color(0xFFB3ABC7);
  static const Color onSecondaryFixed = Color(0xFF1D192B);
  static const Color onSecondaryFixedVariant = Color(0xFF4A4458);

  // =========================
  // 💗 TERTIARY COLORS
  // =========================
  /// Optional accent color for highlighting secondary actions
  static const Color tertiary = Color(0xFF7D5260);

  /// Text/icon on [tertiary]
  static const Color onTertiary = Color(0xFFFFFFFF);

  /// Background for tertiary containers
  static const Color tertiaryContainer = Color(0xFFFFD8E4);

  /// Text/icon on [tertiaryContainer]
  static const Color onTertiaryContainer = Color(0xFF31111D);

  /// Fixed tertiary tones (for dynamic color)
  static const Color tertiaryFixed = Color(0xFFEFB8C8);
  static const Color tertiaryFixedDim = Color(0xFFEFB8C8);
  static const Color onTertiaryFixed = Color(0xFF31111D);
  static const Color onTertiaryFixedVariant = Color(0xFF633B48);

  // =========================
  // ❌ ERROR COLORS
  // =========================
  /// Used for error states, validation messages, etc.
  static const Color error = Color(0xFFB3261E);

  /// Text/icon on [error]
  static const Color onError = Color(0xFFFFFFFF);

  /// Background for error containers
  static const Color errorContainer = Color(0xFFF9DEDC);

  /// Text/icon on [errorContainer]
  static const Color onErrorContainer = Color(0xFF410E0B);

  // =========================
  // 🧱 SURFACE / BACKGROUND
  // =========================
  /// App background color (base surface)
  static const Color surface = Color(0xFFFFFBFE);

  /// Slightly dimmed version of surface
  static const Color surfaceDim = Color(0xFFDED8E1);

  /// Brighter surface for elevated elements
  static const Color surfaceBright = Color(0xFFFEF7FF);

  /// Lowest elevation surface
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);

  /// Slightly raised container
  static const Color surfaceContainerLow = Color(0xFFF7F2FA);

  /// Default surface container
  static const Color surfaceContainer = Color(0xFFF3EDF7);

  /// Higher elevation container
  static const Color surfaceContainerHigh = Color(0xFFECE6F0);

  /// Highest elevation container
  static const Color surfaceContainerHighest = Color(0xFFE6E0E9);

  /// Scaffold background color
  static const Color background = Color(0xFFFFFBFE);

  /// Text/icon color on background or surface
  static const Color onSurface = Color(0xFF1C1B1F);

  /// Less emphasized text/icon color (for labels, hints)
  static const Color onSurfaceVariant = Color(0xFF49454F);

  // =========================
  // ⚙️ OUTLINE / INVERSE / SHADOW
  // =========================
  /// Border lines or dividers
  static const Color outline = Color(0xFF79747E);

  /// Fainter outline for subtle borders
  static const Color outlineVariant = Color(0xFFC4C7C5);

  /// Opposite surface (e.g., dark text on light surface)
  static const Color inverseSurface = Color(0xFF313033);

  /// Text/icon on inverse surface
  static const Color inverseOnSurface = Color(0xFFF4EFF4);

  /// Primary color used on inverse surfaces
  static const Color inversePrimary = Color(0xFFD0BCFF);

  /// Used for backdrop overlays (modals, dialogs)
  static const Color scrim = Color(0xFF000000);

  /// Color for drop shadows
  static const Color shadow = Color(0xFF000000);

  // =========================
  // 🟢 OPTIONAL CUSTOM ADDITIONS
  // =========================
  /// Success color for confirmation messages
  static const Color success = Color(0xFF4CAF50);

  /// Warning color for alerts or caution UI
  static const Color warning = Color(0xFFFFC107);
}
