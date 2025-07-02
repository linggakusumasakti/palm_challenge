part of 'detail_book_bloc.dart';

@freezed
abstract class DetailBookEvent with _$DetailBookEvent {
  const factory DetailBookEvent.likeBook(Book book) = _LikeBook;
  const factory DetailBookEvent.checkLikeStatus(int bookId) = _CheckLikeStatus;
}
