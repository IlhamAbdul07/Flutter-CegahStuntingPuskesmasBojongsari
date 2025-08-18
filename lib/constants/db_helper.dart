// db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// dart run sqflite_common_ffi_web:setup

class DBHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'mydb.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items(
            row INTEGER,
            tgl TEXT,
            nama_anak TEXT,
            jenis_kelamin TEXT,
            usia_anak TEXT
          );
          CREATE TABLE item_details(
            row INTEGER,
            tgl TEXT,
            nama_anak TEXT,
            jenis_kelamin TEXT,
            usia_anak TEXT
          );
        '''); // item_details samain dengan data yg diperlukan
      },
    );
  }

  static Future<int> create(Map<String, dynamic> item) async {
    final db = await initDB();
    return await db.insert('items', item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> createItemDetail(Map<String, dynamic> item) async {
    final db = await initDB();
    return await db.insert('item_details', item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await initDB();
    return await db.query('items');
  }

  static Future<List<Map<String, dynamic>>> getAllItemDetails() async {
    final db = await initDB();
    return await db.query('item_details');
  }

  static Future<int> deleteAll() async {
    final db = await initDB();
    return await db.delete('items');
  }

  static Future<int> deleteAllItemDetails() async {
    final db = await initDB();
    return await db.delete('item_details');
  }
}
