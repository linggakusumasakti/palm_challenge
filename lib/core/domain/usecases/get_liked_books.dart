import '../entities/book.dart';
import '../repositories/book_repository.dart';

class GetLikedBooks {
  final BookRepository repository;

  GetLikedBooks({required this.repository});

  Future<List<Book>> call() {
    return repository.getLikedBooks();
  }
}
