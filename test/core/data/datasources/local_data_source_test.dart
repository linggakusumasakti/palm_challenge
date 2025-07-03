import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/data/datasources/db/database_helper.dart';
import 'package:palm_challenge/core/data/datasources/local_data_source.dart';
import 'package:palm_challenge/core/data/models/book_table_model.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  late LocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDbHelper;

  final tBook = BookTableModel(
    id: 1,
    title: 'Test Book',
    authorsJson: '',
    summariesJson: '',
    subjectsJson: '',
    bookshelvesJson: '',
    languagesJson: '',
    downloadCount: 1,
    formatsJson: '',
  );

  setUp(() {
    mockDbHelper = MockDatabaseHelper();
    dataSource = LocalDataSourceImpl(mockDbHelper);
  });

  group('saveBooks', () {
    test('should clear and insert books', () async {
      when(() => mockDbHelper.clearBooks()).thenAnswer((_) async {});
      when(() => mockDbHelper.insertBooks([tBook])).thenAnswer((_) async {});

      await dataSource.saveBooks([tBook]);

      verify(() => mockDbHelper.clearBooks()).called(1);
      verify(() => mockDbHelper.insertBooks([tBook])).called(1);
    });
  });

  group('getBooks', () {
    test('should return list of books', () async {
      when(() => mockDbHelper.getBooks(DatabaseHelper.tableBooks))
          .thenAnswer((_) async => [tBook]);

      final result = await dataSource.getBooks();

      expect(result, [tBook]);
      verify(() => mockDbHelper.getBooks(DatabaseHelper.tableBooks)).called(1);
    });
  });

  group('likeBook', () {
    test('should delete if already liked', () async {
      when(() => mockDbHelper.isBookLiked(tBook.id))
          .thenAnswer((_) async => true);
      when(() => mockDbHelper.deleteLikeBook(tBook.id))
          .thenAnswer((_) async {});

      await dataSource.likeBook(tBook);

      verify(() => mockDbHelper.deleteLikeBook(tBook.id)).called(1);
    });

    test('should insert if not liked', () async {
      when(() => mockDbHelper.isBookLiked(tBook.id))
          .thenAnswer((_) async => false);
      when(() => mockDbHelper.insertLikedBook(tBook)).thenAnswer((_) async {});

      await dataSource.likeBook(tBook);

      verify(() => mockDbHelper.insertLikedBook(tBook)).called(1);
    });
  });

  group('getLikedBooks', () {
    test('should return list of liked books', () async {
      when(() => mockDbHelper.getBooks(DatabaseHelper.tableLikeBooks))
          .thenAnswer((_) async => [tBook]);

      final result = await dataSource.getLikedBooks();

      expect(result, [tBook]);
      verify(() => mockDbHelper.getBooks(DatabaseHelper.tableLikeBooks))
          .called(1);
    });
  });

  group('isBookLiked', () {
    test('should return like status', () async {
      when(() => mockDbHelper.isBookLiked(tBook.id))
          .thenAnswer((_) async => true);

      final result = await dataSource.isBookLiked(tBook.id);

      expect(result, true);
      verify(() => mockDbHelper.isBookLiked(tBook.id)).called(1);
    });
  });
}
