import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static final SqlHelper _instance = SqlHelper._internal();

  SqlHelper._internal();

  factory SqlHelper() => _instance;

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final db = await openDatabase(
      'flutter_task.db',
      version: 4,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, title TEXT, oldPrice TEXT, newPrice TEXT, sold TEXT)',
        );
        await db.execute(
          'CREATE TABLE categories_images (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, title TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 4) {
          await db.execute(
            'CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, title TEXT, oldPrice TEXT, newPrice TEXT, sold TEXT)',
          );
          await db.execute(
            'CREATE TABLE IF NOT EXISTS categories_images (id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT, title TEXT)',
          );
          await db.execute('''
          CREATE TABLE packages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price TEXT NOT NULL,
            featuresCount INTEGER NOT NULL,
            features TEXT NOT NULL,
            showBadge INTEGER NOT NULL,
            badgeText TEXT,
            showMoreFeatures INTEGER NOT NULL,
            selectedAt TEXT
          )
        ''');
        }
      },
      onOpen: (db) async {
        // await getAllTablesData();
      },
    );
    return db;
  }

  Future<void> insertData({
    required Map<String, dynamic> data,
    required String tableName,
  }) async {
    final db = await database;
    await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData({
    required String tableName,
  }) async {
    final db = await database;
    return db.query(tableName);
  }

  Future<void> deleteData({
    required String tableName,
    required String id,
  }) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateData({
    required String tableName,
    required Map<String, dynamic> data,
    required String id,
  }) async {
    final db = await database;
    await db.update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllData({required String tableName}) async {
    final db = await database;
    await db.delete(tableName);
  }

  Future<Map<String, List<Map<String, dynamic>>>> getAllTablesData() async {
    final db = await database;
    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';",
    );
    Map<String, List<Map<String, dynamic>>> allData = {};
    for (var table in tables) {
      String tableName = table['name'] as String;
      final data = await db.query(tableName);
      allData[tableName] = data;
    }
    return allData;
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
