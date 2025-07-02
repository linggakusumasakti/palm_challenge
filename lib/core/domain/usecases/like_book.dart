import 'package:palm_challenge/core/domain/entities/book.dart';

import '../repositories/book_repository.dart';

class LikeBook {
  final BookRepository repository;

  LikeBook({required this.repository});

  Future<void> call(Book book) {
    return repository.likedBook(book);
  }
}
