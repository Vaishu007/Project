import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smit_project/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "ModiSamaj.db";
  static const _databaseVersion = 1;

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDb);
  }

  _onCreateDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${User.tblUser}(
    ${User.colID} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${User.colName} TEXT NOT NULL,
      ${User.colGender} TEXT NOT NULL,
      ${User.colPhone} TEXT NOT NULL,
      ${User.colEmail} TEXT NOT NULL,
      ${User.colPassword} TEXT NOT NULL,
      ${User.colAddress} INTEGER NOT NULL
      )
    ''');
    print("Create table");
  }

  Future<int> insertUser(User user) async {
    Database? db = await database;
    return await db!.insert(User.tblUser, user.toMap());
  }

  Future<User?> loginUser(String phone, String password) async {
    Database? db = await database;
    var res = await db!.rawQuery(
        "SELECT * FROM ${User.tblUser} WHERE ${User.colPhone} = $phone and ${User.colPassword} = $password");
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }
}
