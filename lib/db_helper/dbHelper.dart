import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smit_project/gridWidget/help_center/help_center.dart';
import 'package:smit_project/model/help_center_model.dart';
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
    await db.execute('''
    CREATE TABLE ${HelpCenterModel.tblHelpCenter}(
    ${HelpCenterModel.colID} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${HelpCenterModel.colName} TEXT NOT NULL,
      ${HelpCenterModel.colPhone} TEXT NOT NULL,
      ${HelpCenterModel.colDesignation} TEXT NOT NULL,
      ${HelpCenterModel.colCity} TEXT NOT NULL,
      ${HelpCenterModel.colZone} TEXT NOT NULL
      )
    ''');
    print("Create table");

  }

  Future<int> insertUser(User user) async {
    Database? db = await database;
    return await db!.insert(User.tblUser, user.toMap());
  }

  Future<int> insertHelpCenter(HelpCenterModel helpCenterModel) async{
    Database? db = await database;
    return await db!.insert(HelpCenterModel.tblHelpCenter, helpCenterModel.toMap());
  }

  Future<int> updateUser(User user) async {
    Database? db = await database;
    return await db!.update(User.tblUser, user.toMap(),
        where: "${User.colID}=?", whereArgs: [user.id]);
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

  Future<User?> getUser(int id) async {
    Database? db = await database;
    var res = await db!.rawQuery(
        "SELECT * FROM ${User.tblUser} WHERE ${User.colID} = $id");
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<List<HelpCenterModel>> getHelpData() async {
    Database? db = await database;
    List<Map<String, dynamic>> res = await db!.query(HelpCenterModel.tblHelpCenter);
    print(res);
    return res.isNotEmpty ? res.map((e) => HelpCenterModel.fromMap(e)).toList() : [];
  }

  Future<int> deleteHelpData(int id) async {
    Database? db = await database;
    return db!.delete(HelpCenterModel.tblHelpCenter, where: "${HelpCenterModel.colID} = ?", whereArgs: [id]);
  }
}
