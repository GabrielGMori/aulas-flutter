import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  static const int _version = 5;
  static const String _dbName = 'instagram_db.db';

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
    return openDatabase(
      path,
      onCreate: _createDb,
      onUpgrade: _upgradeDb,
      version: _version,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        text TEXT NOT NULL,
        liked INTEGER NOT NULL
      );
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS stories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT NOT NULL,
        color TEXT NOT NULL,
        blocked INTEGER NOT NULL
      );
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS comments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT NOT NULL,
        post_id INTEGER NOT NULL,
        CONSTRAINT fk_comment_post
          FOREIGN KEY (post_id)
          REFERENCES posts (id)
          ON DELETE CASCADE
      );
    ''');
  }

  Future _upgradeDb(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }
}
