import '../entities/book.dart';
import '../repositories/book_repository.dart';

class GetBooks {
  final BookRepository repository;

  GetBooks({required this.repository});

  Future<List<Book>> call({int page = 1, String? search}) {
    return repository.getBooks(page: page, search: search);
  }
}
