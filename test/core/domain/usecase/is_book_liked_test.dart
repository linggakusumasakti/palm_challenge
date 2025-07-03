import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';
import 'package:palm_challenge/core/domain/usecases/is_book_liked.dart';

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  late IsBookLiked isBookLiked;
  late MockBookRepository mockRepository;

  setUp(() {
    mockRepository = MockBookRepository();
    isBookLiked = IsBookLiked(repository: mockRepository);
  });

  const bookId = 1;

  test('should return true when book is liked', () async {
    // arrange
    when(() => mockRepository.isBookLiked(bookId))
        .thenAnswer((_) async => true);

    // act
    final result = await isBookLiked(bookId);

    // assert
    expect(result, true);
    verify(() => mockRepository.isBookLiked(bookId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return false when book is not liked', () async {
    // arrange
    when(() => mockRepository.isBookLiked(bookId))
        .thenAnswer((_) async => false);

    // act
    final result = await isBookLiked(bookId);

    // assert
    expect(result, false);
    verify(() => mockRepository.isBookLiked(bookId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
