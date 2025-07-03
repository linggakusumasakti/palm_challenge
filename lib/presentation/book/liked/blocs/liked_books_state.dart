part of 'liked_books_bloc.dart';

@freezed
class LikedBooksState with _$LikedBooksState {
  const factory LikedBooksState.initial() = Initial;

  const factory LikedBooksState.loading() = Loading;

  const factory LikedBooksState.empty() = Empty;

  const factory LikedBooksState.loaded(
      {required List<Book> books}) = Loaded;

  const factory LikedBooksState.error(String message) = Error;
}
