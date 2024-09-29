import 'package:dixi_prectical/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'entries.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE entries(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<List<Entry>> getEntries() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('entries');

    return List.generate(maps.length, (i) {
      return Entry.fromMap(maps[i]);
    });
  }

  Future<void> addEntry(Entry entry) async {
    final db = await database;
    await db.insert(
      'entries',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateEntry(Entry entry) async {
    final db = await database;
    await db.update(
      'entries',
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  Future<void> deleteEntry(int id) async {
    final db = await database;
    await db.delete(
      'entries',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
