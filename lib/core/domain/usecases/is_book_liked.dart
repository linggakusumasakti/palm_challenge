import '../repositories/book_repository.dart';

class IsBookLiked {
  final BookRepository repository;

  IsBookLiked({required this.repository});

  Future<bool> call(int bookId) {
    return repository.isBookLiked(bookId);
  }
}
