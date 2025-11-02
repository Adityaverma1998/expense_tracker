import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  // Supported languages
  static const supportedLocales = [
    Locale('en'), // English
    Locale('hi'), // Hindi
    Locale('es'), // Spanish
  ];

  // Path to JSON files
  static const path = 'lib/core/localization/translations';

  // Default locale
  static const fallbackLocale = Locale('en');

  // Initialize EasyLocalization wrapper
  static Widget init(Widget child) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: path,
      fallbackLocale: fallbackLocale,
      saveLocale: true,
      child: child,
    );
  }

  static String tr(String key) {
    return key.tr();
  }


  // Shortcut to get translated text
  static String trArgs(String key, {Map<String, String>? args}) {
    return key.tr(namedArgs: args);
  }


  // Change locale dynamically
  static Future<void> changeLocale(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
  }

  static Future<void> toggleLanguage(BuildContext context) async {
    final current = context.locale;
    final newLocale = current.languageCode == 'en'
        ? const Locale('hi')
        : const Locale('en');
    await changeLocale(context, newLocale);
  }

  // Get current locale
  static Locale currentLocale(BuildContext context) => context.locale;


}
