part of 'liked_books_bloc.dart';

@freezed
abstract class LikedBooksEvent with _$LikedBooksEvent {
  const factory LikedBooksEvent.getLikedBooks() = _GetLikedBooks;
}
