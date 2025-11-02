import 'package:easy_localization/easy_localization.dart';
import 'package:expense_tracker/core/localization/app_localization.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/presentation/home/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Theming Demo',
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      themeMode: AppTheme.themeMode,

      //  Localization setup
      supportedLocales: AppLocalization.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: HomeScreen(),

    );

  }


}
