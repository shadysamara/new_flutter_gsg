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

  insertintoDatabase() async {
    Map<String, dynamic> map = {'name': 'shady', 'age': 32, 'gender': 1};
    int rowIndex = await database.insert('testTable', map);
    print(rowIndex);
  }

  getAllDataFromDatabase() async {
    List<Map<String, dynamic>> results =
        await database.query('testTable', where: 'name=?', whereArgs: ['omar']);
    print(results);
  }

  getOneRowFromDatabase() {}
  deleteDataFromDatabase() {
    database.delete('testTable', where: 'name=?', whereArgs: ['omar']);
  }

  updateDataInDatabase() {
    Map<String, dynamic> map = {'name': 'shady2', 'age': 32, 'gender': 1};
    database.update('testTable', map, where: 'id=?', whereArgs: [2]);
  }
}
