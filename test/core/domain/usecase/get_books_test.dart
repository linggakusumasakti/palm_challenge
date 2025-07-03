import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/get_books.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late GetBooks getBooks;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    getBooks = GetBooks(repository: mockRepository);
  });

  final tBooks = [
    Book(
      id: 1,
      title: 'Book 1',
      authors: [],
      formats: {'image/jpeg': 'url'},
      summaries: [],
      subjects: [],
      bookshelves: [],
      languages: [],
      downloadCount: 10,
    ),
  ];

  test('should return list of books from repository', () async {
    // arrange
    when(() => mockRepository.getBooks(page: 1, search: null))
        .thenAnswer((_) async => tBooks);

    // act
    final result = await getBooks(page: 1);

    // assert
    expect(result, tBooks);
    verify(() => mockRepository.getBooks(page: 1, search: null)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
