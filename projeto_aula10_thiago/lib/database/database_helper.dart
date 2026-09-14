import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  static const int _version = 1;
  static const String _dbName = 'instagram_db.db';

  Future _createDb(Database db, int version) async{
    await db.execute('''
        CREATE TABLE posts 
          (id INTEGER  PRIMARY  KEY AUTOINCREMENT,
          title  TEXT NOT NULL,
          text TEXT NOT NULL,
          liked INTEGER NOT NULL)''');

    await db.execute('''
    CREATE TABLE stories
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      view INTEGER NOT NULL)''');

    await db.execute('''
    CREATE TABLE commentes
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      texto TEXT NOT NULL,
      post_id INTEGER,
      FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE
      )''');
  }

  Future<Database> get database async => _database ??= await _initDatabase();


  Future<Database> _initDatabase() async {
    Directory documentsDir = await getApplicationCacheDirectory();
    String path = join(documentsDir.path, _dbName);
    return openDatabase(path, onCreate: _createDb, version: _version);
  }
}