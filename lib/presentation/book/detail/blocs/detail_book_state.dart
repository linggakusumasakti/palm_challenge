part of 'detail_book_bloc.dart';

@freezed
abstract class DetailBookState with _$DetailBookState {
  const factory DetailBookState.initial() = _Initial;
  const factory DetailBookState.loading() = _Loading;
  const factory DetailBookState.success(bool isLiked) = Success;
  const factory DetailBookState.error(String message) = _Error;
}
