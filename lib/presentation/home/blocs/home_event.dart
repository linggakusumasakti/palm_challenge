part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchBook({@Default(1) int page}) = _FetchBook;

  const factory HomeEvent.test() = _Test;
}
