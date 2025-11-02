import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:expense_tracker/data/local/database/app_database.dart';
import 'package:expense_tracker/data/local/database/floor_database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // Floor database
    final floorDbHelper = FloorDatabaseHelper();
    final db = await floorDbHelper.getDataBase;
    getIt.registerSingleton<AppDatabase>(db);
    getIt.registerSingleton<FloorDatabaseHelper>(floorDbHelper);

    // Shared Preferences
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);

    // Flutter Secure Storage
    const secureStorage = FlutterSecureStorage();
    getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
  }
}
