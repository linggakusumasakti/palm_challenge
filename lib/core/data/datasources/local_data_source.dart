import 'package:palm_challenge/core/data/models/book_table_model.dart';

import 'db/database_helper.dart';

abstract class LocalDataSource {
  Future<void> saveBooks(List<BookTableModel> books);

  Future<List<BookTableModel>> getBooks();

  Future<void> likeBook(BookTableModel book);

  Future<List<BookTableModel>> getLikedBooks();

  Future<bool> isBookLiked(int bookId);
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper dbHelper;

  LocalDataSourceImpl(this.dbHelper);

  @override
  Future<void> saveBooks(List<BookTableModel> books) async {
    await dbHelper.clearBooks();
    await dbHelper.insertBooks(books);
  }

  @override
  Future<List<BookTableModel>> getBooks() async {
    return await dbHelper.getBooks(DatabaseHelper.tableBooks);
  }

  @override
  Future<void> likeBook(BookTableModel book) async {
    final isLiked = await dbHelper.isBookLiked(book.id);
    if (isLiked) {
      await dbHelper.deleteLikeBook(book.id);
    } else {
      await dbHelper.insertLikedBook(book);
    }
  }

  @override
  Future<List<BookTableModel>> getLikedBooks() async {
    return await dbHelper.getBooks(DatabaseHelper.tableLikeBooks);
  }

  @override
  Future<bool> isBookLiked(int bookId) async {
    return await dbHelper.isBookLiked(bookId);
  }
}
