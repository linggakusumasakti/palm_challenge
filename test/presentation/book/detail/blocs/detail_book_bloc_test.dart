import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/core/domain/usecases/is_book_liked.dart';
import 'package:palm_challenge/core/domain/usecases/like_book.dart';
import 'package:palm_challenge/presentation/book/detail/blocs/detail_book_bloc.dart';

class MockLikeBook extends Mock implements LikeBook {}

class MockIsBookLiked extends Mock implements IsBookLiked {}

void main() {
  late MockLikeBook mockLikeBook;
  late MockIsBookLiked mockIsBookLiked;
  late DetailBookBloc bloc;

  const tBookId = 1;

  final tBook = Book(
    id: tBookId,
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
    mockLikeBook = MockLikeBook();
    mockIsBookLiked = MockIsBookLiked();
    bloc = DetailBookBloc(mockLikeBook, mockIsBookLiked);
  });

  group('LikeBook', () {
    blocTest<DetailBookBloc, DetailBookState>(
      'emits [loading, success(true)] when book liked successfully',
      build: () {
        when(() => mockLikeBook.call(tBook)).thenAnswer((_) async {});
        when(() => mockIsBookLiked.call(tBookId)).thenAnswer((_) async => true);
        return bloc;
      },
      act: (bloc) => bloc.add(DetailBookEvent.likeBook(tBook)),
      expect: () => [
        const DetailBookState.loading(),
        const DetailBookState.success(true),
      ],
      verify: (_) {
        verify(() => mockLikeBook.call(tBook)).called(1);
        verify(() => mockIsBookLiked.call(tBookId)).called(1);
      },
    );

    blocTest<DetailBookBloc, DetailBookState>(
      'emits [loading, error] when liking book throws error',
      build: () {
        when(() => mockLikeBook.call(tBook)).thenThrow(Exception('Failed'));
        return bloc;
      },
      act: (bloc) => bloc.add(DetailBookEvent.likeBook(tBook)),
      expect: () => [
        const DetailBookState.loading(),
        DetailBookState.error('Exception: Failed'),
      ],
    );
  });

  group('CheckLikeStatus', () {
    blocTest<DetailBookBloc, DetailBookState>(
      'emits [success(true)] when book is liked',
      build: () {
        when(() => mockIsBookLiked.call(tBookId)).thenAnswer((_) async => true);
        return bloc;
      },
      act: (bloc) => bloc.add(const DetailBookEvent.checkLikeStatus(tBookId)),
      expect: () => [const DetailBookState.success(true)],
    );

    blocTest<DetailBookBloc, DetailBookState>(
      'emits [error] when check like status throws',
      build: () {
        when(() => mockIsBookLiked.call(tBookId)).thenThrow(Exception('Error'));
        return bloc;
      },
      act: (bloc) => bloc.add(const DetailBookEvent.checkLikeStatus(tBookId)),
      expect: () => [DetailBookState.error('Exception: Error')],
    );
  });
}
