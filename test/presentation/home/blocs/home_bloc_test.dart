import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/usecases/get_books.dart';
import 'package:palm_challenge/presentation/home/blocs/home_bloc.dart';

class MockGetBooks extends Mock implements GetBooks {}

void main() {
  late MockGetBooks mockGetBooks;

  final tBook = Book(
    id: 1,
    title: 'Test Book',
    authors: [],
    formats: {'image/jpeg': 'url'},
    summaries: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    downloadCount: 100,
  );

  setUp(() {
    mockGetBooks = MockGetBooks();
  });

  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emits [Loading, Loaded] when _FetchBook is added',
      build: () {
        when(() => mockGetBooks.call(page: 1, search: null))
            .thenAnswer((_) async => [tBook]);
        return HomeBloc(mockGetBooks);
      },
      act: (bloc) => bloc.add(const HomeEvent.fetchBook()),
      expect: () => [
        const HomeState.loading(),
        HomeState.loaded(books: [tBook], page: 1, hasReachedMax: false),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [Loaded with more books] when _LoadMore is added and not reached max',
      build: () {
        when(() => mockGetBooks.call(page: 1, search: null))
            .thenAnswer((_) async => [tBook]);
        when(() => mockGetBooks.call(page: 2, search: null))
            .thenAnswer((_) async => [tBook]);
        return HomeBloc(mockGetBooks);
      },
      seed: () => HomeState.loaded(books: [tBook], page: 1, hasReachedMax: false),
      act: (bloc) => bloc.add(const HomeEvent.loadMore()),
      expect: () => [
        HomeState.loaded(books: [tBook, tBook], page: 2, hasReachedMax: false),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [Loaded with hasReachedMax true] when no more books are available',
      build: () {
        when(() => mockGetBooks.call(page: 2, search: null))
            .thenAnswer((_) async => []);
        return HomeBloc(mockGetBooks);
      },
      seed: () => HomeState.loaded(books: [tBook], page: 1, hasReachedMax: false),
      act: (bloc) => bloc.add(const HomeEvent.loadMore()),
      expect: () => [
        HomeState.loaded(books: [tBook], page: 1, hasReachedMax: true),
      ],
    );
  });
}
