import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/like_book.dart';

class MockBookRepository extends Mock implements BookRepository {}

class FakeBook extends Fake implements Book {}

void main() {
  late LikeBook likeBook;
  late MockBookRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(FakeBook());
  });

  setUp(() {
    mockRepository = MockBookRepository();
    likeBook = LikeBook(repository: mockRepository);
  });

  final tBook = Book(
    id: 1,
    title: 'Test Book',
    authors: [],
    formats: {'image/jpeg': 'url'},
    summaries: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    downloadCount: 10,
  );

  test('should call likedBook on repository', () async {
    // arrange
    when(() => mockRepository.likedBook(any()))
        .thenAnswer((_) async => Future.value());

    // act
    await likeBook(tBook);

    // assert
    verify(() => mockRepository.likedBook(tBook)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
