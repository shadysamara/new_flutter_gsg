import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  Database database;
  initDatabase() async {
    if (database == null) {
      database = await connectToDataBase();
    }
  }

  Future<Database> connectToDataBase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String databasePath = join(appDocPath, 'shady.db');
    Database database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        createTable(db);
      },
    );
    return database;
  }

  createTable(Database db) {
    db.execute('''CREATE TABLE testTable(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
age INTEGER NOT NULL,
gender INTEGER
)''');
  }
}
