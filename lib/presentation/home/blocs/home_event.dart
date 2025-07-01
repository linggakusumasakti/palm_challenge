part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetchBook({String? query}) = _FetchBook;
  const factory HomeEvent.loadMore({String? query}) = _LoadMore;
}
