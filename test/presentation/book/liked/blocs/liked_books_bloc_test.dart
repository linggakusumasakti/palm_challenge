import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/usecases/get_liked_books.dart';
import 'package:palm_challenge/presentation/book/liked/blocs/liked_books_bloc.dart';

class MockGetLikedBooks extends Mock implements GetLikedBooks {}

void main() {
  late LikedBooksBloc bloc;
  late MockGetLikedBooks mockGetLikedBooks;

  setUp(() {
    mockGetLikedBooks = MockGetLikedBooks();
    bloc = LikedBooksBloc(mockGetLikedBooks);
  });

  final tBook = Book(
    id: 1,
    title: 'Book 1',
    authors: [],
    formats: {'image/jpeg': 'url'},
    summaries: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    downloadCount: 100,
  );

  group('GetLikedBooks', () {
    blocTest<LikedBooksBloc, LikedBooksState>(
      'emits [loading, loaded] when there are liked books',
      build: () {
        when(() => mockGetLikedBooks.call())
            .thenAnswer((_) async => [tBook]);
        return bloc;
      },
      act: (bloc) => bloc.add(const LikedBooksEvent.getLikedBooks()),
      expect: () => [
        const LikedBooksState.loading(),
        LikedBooksState.loaded(books: [tBook]),
      ],
      verify: (_) {
        verify(() => mockGetLikedBooks.call()).called(1);
      },
    );

    blocTest<LikedBooksBloc, LikedBooksState>(
      'emits [loading, empty] when no liked books found',
      build: () {
        when(() => mockGetLikedBooks.call())
            .thenAnswer((_) async => []);
        return bloc;
      },
      act: (bloc) => bloc.add(const LikedBooksEvent.getLikedBooks()),
      expect: () => [
        const LikedBooksState.loading(),
        const LikedBooksState.empty(),
      ],
    );
  });
}
