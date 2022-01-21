import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'favorites.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE favorite_stories(id TEXT PRIMARY KEY,title TEXT,author TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }

  static Future<void> delete(String table,String id) async {
    final db = await DbHelper.database();
    db.rawDelete('DELETE FROM $table WHERE id = $id');
  }
}
