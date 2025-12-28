import 'package:expense_tracker/data/local/dao/post_dao.dart';
import 'package:expense_tracker/data/local/database/app_database.dart';
import 'package:expense_tracker/data/local/database/floor_database_helper.dart';
import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
import 'package:expense_tracker/di/serivce_locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LocalModule {
  static Future<void> configureLocalModuleInjection() async {
    // Floor database
    final floorDbHelper = FloorDatabaseHelper();
    final db = await floorDbHelper.getDataBase;

    getIt.registerSingleton<AppDatabase>(db);
    getIt.registerSingleton<FloorDatabaseHelper>(floorDbHelper);

    //  REGISTER DAO FROM DATABASE
    getIt.registerSingleton<PostDao>(db.postDao);

    // Shared Preferences
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);

    getIt.registerLazySingleton<SharedPrefHelper>(
      () => SharedPrefHelper(getIt<SharedPreferences>()),
    );

    // Secure Storage
    const secureStorage = FlutterSecureStorage();
    getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
  }
}
