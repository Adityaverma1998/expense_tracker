import 'package:expense_tracker/data/local/database/floor_database_helper.dart';
import 'package:expense_tracker/presentation/my_app.dart';
import 'package:flutter/material.dart';

void main()  async{
   WidgetsFlutterBinding.ensureInitialized();

WidgetsFlutterBinding.ensureInitialized();
  await FloorDatabaseHelper().callDatabase;


  runApp(const MyApp());
}


