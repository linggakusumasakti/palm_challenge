import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/get_liked_books.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late GetLikedBooks getLikedBooks;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    getLikedBooks = GetLikedBooks(repository: mockRepository);
  });

  final tLikedBooks = [
    Book(
      id: 1,
      title: 'Liked Book',
      authors: [],
      formats: {'image/jpeg': 'url'},
      summaries: [],
      subjects: [],
      bookshelves: [],
      languages: [],
      downloadCount: 10,
    ),
  ];

  test('should return list of liked books from repository', () async {
    // arrange
    when(() => mockRepository.getLikedBooks())
        .thenAnswer((_) async => tLikedBooks);

    // act
    final result = await getLikedBooks();

    // assert
    expect(result, tLikedBooks);
    verify(() => mockRepository.getLikedBooks()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
