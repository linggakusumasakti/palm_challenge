part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchBook() = _FetchBook;

  const factory HomeEvent.test() = _Test;
}
