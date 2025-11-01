
import 'package:expense_tracker/data/local/database/app_database.dart';
import 'package:floor/floor.dart';

class FloorDatabaseHelper {

  static AppDatabase? app_database;

  Future<AppDatabase> get callDatabase async {
    return await $FloorAppDatabase
        .databaseBuilder('expense_tracker.db')
        .build();
  }

  Future<AppDatabase> get getDataBase async {
    if (app_database != null) {
      return app_database!;
    } else {
      app_database = await callDatabase;
      return app_database!;
    }
  }

}
