part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.loaded(
      {required List<Book> books,
      required int page,
      required bool hasReachedMax}) = Loaded;

  const factory HomeState.error(String message) = Error;
}
