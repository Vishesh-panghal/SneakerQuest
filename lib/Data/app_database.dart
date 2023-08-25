// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:io';

import 'package:nike_store/Data/app_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  //We create a private Constuctor because after this no public constructor were created.
  AppDatabase._();
  // We want singelton class so we created this.
  static final AppDatabase db = AppDatabase._();

// Database variable
  Database? _database;
  static const USER_TABLE = 'usr';
  static const USER_COLUMN_EMAIL = 'email';
  static const USER_COLUMN_PHONE = 'phone';
  static const USER_COLUMN_PASSWORD = 'password';

  // Now we call Database here:-
  Future<Database> getDB() async {
    // Here we check that if we have already Database created,than go on that otherwise create a database.
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

  // Initilize Databse here:-
  Future<Database> initDb() async {
    // Extract path of machine to store database
    Directory doucumentDirectory = await getApplicationDocumentsDirectory();

    // Make a new folder to store data...
    var dbPath = join(doucumentDirectory.path, "userDB.db");
    // here we return database with path,version,and onCreate..
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        // Here we assign table name and their Columns...(All SQL queries)..
        db.execute(
            "Create table $USER_TABLE ($USER_COLUMN_EMAIL text primary key, $USER_COLUMN_PHONE text ,$USER_COLUMN_PASSWORD text )");
      },
    );
  }

  Future<List<UsrModel>> fetchUsr() async {
    var db = await getDB();
    List<Map<String, dynamic>> user = await db.query(USER_TABLE);
    List<UsrModel> usrList = [];
    for (Map<String, dynamic> usr in user) {
      usrList.add(UsrModel.fromMap(usr));
    }
    return usrList;
  }

  Future<bool> addusr(UsrModel usr) async {
    var db = await getDB();
    var rowsEffected = await db.insert(USER_TABLE, usr.toMap());
    if (rowsEffected > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> findUser(String email) async {
    var db = await getDB();

    var count = await db.rawQuery(
        "SELECT * FROM $USER_TABLE WHERE $USER_COLUMN_EMAIL = ?", [email]);
    print("Count find user:-${count.isEmpty}");
    return count.isEmpty;
  }

  Future<bool> loginUsr(String email, String pass) async {
    var db = await getDB();
    var count = await db.rawQuery(
        "SELECT * FROM $USER_TABLE WHERE $USER_COLUMN_EMAIL = ? AND $USER_COLUMN_PASSWORD = ?",
        [email, pass]);
    return count.isNotEmpty;
  }

  Future<void> deleteTable() async {
    var db = await getDB();
    await db.execute("DROP TABLE IF EXISTS $USER_TABLE");
  }

  Future<void> deleteQ() async {
    Directory doucumentDirectory = await getApplicationDocumentsDirectory();
    // Make a new folder to store data...
    var dbPath = join(doucumentDirectory.path, "userDB.db");
    await deleteDatabase(dbPath);
  }
}
