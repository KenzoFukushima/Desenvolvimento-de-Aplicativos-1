import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  static const int _version = 1;
  static const String _dbName = 'fitPro_db.db';

  Future _createDb(Database db, int version) async{
    await db.execute('''
        CREATE TABLE treinos 
          (id INTEGER  PRIMARY  KEY AUTOINCREMENT,
          nome  TEXT NOT NULL,
          grupoMuscular TEXT NOT NULL,
          series INT,
          repeticao INT,
          carga DOUBLE,
          favorito INTEGER NOT NULL)''');
  }

  Future<Database> get database async => _database ??= await _initDatabase();


  Future<Database> _initDatabase() async {
    Directory documentsDir = await getApplicationCacheDirectory();
    String path = join(documentsDir.path, _dbName);
    return openDatabase(path, onCreate: _createDb, version: _version);
  }
}