import 'package:palm_challenge/core/data/models/book_table_model.dart';

import 'db/database_helper.dart';

abstract class LocalDataSource {
  Future<void> saveBooks(List<BookTableModel> books);

  Future<List<BookTableModel>> getBooks();
}

class LocalDataSourceImpl implements LocalDataSource {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<void> saveBooks(List<BookTableModel> books) async {
    await dbHelper.clearBooks();
    await dbHelper.insertBooks(books);
  }

  @override
  Future<List<BookTableModel>> getBooks() async {
    return await dbHelper.getBooks();
  }
}
