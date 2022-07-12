import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance =  DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path , 'productTable.db');
    return await openDatabase(
      path,
      version: 3,
      onCreate:  _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cartTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          price INTEGER NOT NULL,
          description TEXT NOT NULL,
          category TEXT NOT NULL,
          images TEXT NOT NULL,
          color INTEGER NOT NULL,
          size TEXT NOT NULL,
          quantity INTEGER NOT NULL,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE favoriteTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          price INTEGER NOT NULL,
          description TEXT NOT NULL,
          category TEXT NOT NULL,
          images TEXT NOT NULL,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
      )
      ''');


    await db.execute('''
      CREATE TABLE orderProductsTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userId INTEGER NOT NULL,
          title TEXT NOT NULL,
          status INTEGER NOT NULL,
          icon INTEGER NOT NULL,
          repetitionType INTEGER NOT NULL,
          quote TEXT NOT NULL,
          getNotification INTEGER NOT NULL,
          getPopUp INTEGER NOT NULL,
          alarmTime TEXT NOT NULL,
          remind INTEGER NOT NULL,
          repeatTable TEXT NOT NULL,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE orderTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          currentStreak INTEGER NOT NULL,
          doneCycleCount INTEGER NOT NULL,
          failCycleCount INTEGER NOT NULL,
          totalCycle INTEGER NOT NULL,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL,
          taskId INTEGER NOT NULL,
          FOREIGN KEY (taskId) REFERENCES habitTask (habitId)              
      )
      ''');
  }
}