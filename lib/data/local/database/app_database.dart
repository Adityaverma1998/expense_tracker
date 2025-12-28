import 'dart:async';

import 'package:expense_tracker/data/local/dao/post_dao.dart';
import 'package:expense_tracker/data/local/models/posts_db_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [PostDbModel])
abstract class AppDatabase extends FloorDatabase {
  PostDao get postDao;
}
