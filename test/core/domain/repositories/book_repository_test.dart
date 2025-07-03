import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/data/datasources/local_data_source.dart';
import 'package:palm_challenge/core/data/datasources/remote_data_source.dart';
import 'package:palm_challenge/core/data/models/book_model.dart';
import 'package:palm_challenge/core/data/models/book_table_model.dart';
import 'package:palm_challenge/core/data/utils/connection_checker.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/repositories/book_repository.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockConnectionChecker extends Mock implements ConnectionChecker {}

void main() {
  late BookRepository repository;
  late MockRemoteDataSource mockRemote;
  late MockLocalDataSource mockLocal;
  late MockConnectionChecker mockConnection;
  setUpAll(() {
    registerFallbackValue(BookTableModel(
      id: 0,
      title: '',
      authorsJson: '[]',
      summariesJson: '[]',
      subjectsJson: '[]',
      bookshelvesJson: '[]',
      languagesJson: '[]',
      downloadCount: 0,
      formatsJson: '{}',
    ));
  });
  setUp(() {
    mockRemote = MockRemoteDataSource();
    mockLocal = MockLocalDataSource();
    mockConnection = MockConnectionChecker();

    repository = BookRepositoryImpl(
      remoteDataSource: mockRemote,
      localDataSource: mockLocal,
      connectionChecker: mockConnection,
    );
  });

  final tBookModel = BookModel(
    id: 1,
    title: 'Test Book',
    authors: [],
    formats: {'image/jpeg': 'url'},
    summaries: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    downloadCount: 1,
  );

  final tBookTableModel = BookTableModel(
    id: 1,
    title: 'Test Book',
    authorsJson: '[]',
    summariesJson: '[]',
    subjectsJson: '[]',
    bookshelvesJson: '[]',
    languagesJson: '[]',
    formatsJson: '{"image/jpeg":"url"}',
    downloadCount: 1,
  );

  final tBookEntity = Book(
    id: 1,
    title: 'Test Book',
    authors: [],
    formats: {'image/jpeg': 'url'},
    summaries: [],
    subjects: [],
    bookshelves: [],
    languages: [],
    downloadCount: 1,
  );

  group('getBooks', () {
    test('should return remote books when online', () async {
      when(() => mockConnection.isConnected).thenAnswer((_) async => true);
      when(() => mockRemote.getBooks(page: 1, search: null))
          .thenAnswer((_) async => [tBookModel]);
      when(() => mockLocal.saveBooks(any())).thenAnswer((_) async {});

      final result = await repository.getBooks();

      expect(result.first.id, tBookEntity.id);
      verify(() => mockRemote.getBooks(page: 1, search: null)).called(1);
      verify(() => mockLocal.saveBooks(any())).called(1);
    });

    test('should return local books when offline', () async {
      when(() => mockConnection.isConnected).thenAnswer((_) async => false);
      when(() => mockLocal.getBooks())
          .thenAnswer((_) async => [tBookTableModel]);

      final result = await repository.getBooks();

      expect(result.first.id, tBookEntity.id);
      verify(() => mockLocal.getBooks()).called(1);
    });

    test('should return local books when remote throws error', () async {
      when(() => mockConnection.isConnected).thenAnswer((_) async => true);
      when(() => mockRemote.getBooks(page: 1, search: null))
          .thenThrow(Exception());
      when(() => mockLocal.getBooks())
          .thenAnswer((_) async => [tBookTableModel]);

      final result = await repository.getBooks();

      expect(result.first.id, tBookEntity.id);
      verify(() => mockLocal.getBooks()).called(1);
    });
  });

  group('likedBook', () {
    test('should call local.likeBook', () async {
      when(() => mockLocal.likeBook(any())).thenAnswer((_) async {});

      await repository.likedBook(tBookEntity);

      verify(() => mockLocal.likeBook(any())).called(1);
    });
  });

  group('isBookLiked', () {
    test('should return true when book is liked', () async {
      when(() => mockLocal.isBookLiked(1)).thenAnswer((_) async => true);

      final result = await repository.isBookLiked(1);

      expect(result, true);
    });
  });

  group('getLikedBooks', () {
    test('should return list of liked books', () async {
      when(() => mockLocal.getLikedBooks())
          .thenAnswer((_) async => [tBookTableModel]);

      final result = await repository.getLikedBooks();

      expect(result.first.id, tBookEntity.id);
    });
  });
}
