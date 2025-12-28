import 'package:easy_localization/easy_localization.dart';
import 'package:expense_tracker/core/localization/app_localization.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:expense_tracker/presentation/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  //  VERY IMPORTANT: setup DI
  await ServiceLocator.configureDependencies();

  runApp(AppLocalization.init(const MyApp()));
}
