import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/book_table_model.dart';

class DatabaseHelper {
  static const _dbName = 'books.db';
  static const _dbVersion = 1;
  static const tableBooks = 'books';
  static const tableLikeBooks = 'like_books';

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
    await db.execute('''
      CREATE TABLE $tableLikeBooks (
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

  Future<void> insertLikedBook(BookTableModel book) async {
    final db = await database;
    await db.insert(tableLikeBooks, book.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteLikeBook(int bookId) async {
    final db = await database;
    await db.delete(
      tableLikeBooks,
      where: 'id = ?',
      whereArgs: [bookId],
    );
  }

  Future<List<BookTableModel>> getBooks(String table) async {
    final db = await database;
    final maps = await db.query(table);
    return maps.map((e) => BookTableModel.fromJson(e)).toList();
  }

  Future<bool> isBookLiked(int bookId) async {
    final db = await database;
    final result = await db.query(
      tableLikeBooks,
      where: 'id = ?',
      whereArgs: [bookId],
    );
    return result.isNotEmpty;
  }

  Future<void> clearBooks() async {
    final db = await database;
    await db.delete(tableBooks);
  }
}
