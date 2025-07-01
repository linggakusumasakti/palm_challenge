import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/book_table_model.dart';

class DatabaseHelper {
  static const _dbName = 'books.db';
  static const _dbVersion = 1;
  static const tableBooks = 'books';

  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableBooks (
        id INTEGER PRIMARY KEY,
        title TEXT,
        authorsJson TEXT,
        summariesJson TEXT,
        subjectsJson TEXT,
        bookshelvesJson TEXT,
        languagesJson TEXT,
        downloadCount INTEGER,
        formatsJson TEXT,
        mediaType TEXT,
        copyright INTEGER
      )
    ''');
  }

  Future<void> insertBooks(List<BookTableModel> books) async {
    final db = await database;
    final batch = db.batch();
    for (var book in books) {
      batch.insert(
        tableBooks,
        book.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<BookTableModel>> getBooks() async {
    final db = await database;
    final maps = await db.query(tableBooks);
    return maps.map((e) => BookTableModel.fromJson(e)).toList();
  }

  Future<void> clearBooks() async {
    final db = await database;
    await db.delete(tableBooks);
  }
}
