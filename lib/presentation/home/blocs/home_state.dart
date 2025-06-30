part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.loaded(List<Book> books) = Loaded;

  const factory HomeState.error(String message) = Error;
}
