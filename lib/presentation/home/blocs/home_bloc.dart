import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/entities/book.dart';
import '../../../core/domain/usecases/get_books.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooks getBooks;

  HomeBloc(this.getBooks) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case _FetchBook(:final page):
          emit(const HomeState.loading());
          try {
            final books = await getBooks.call(page: page);
            emit(HomeState.loaded(books));
          } catch (e) {
            emit(HomeState.error(e.toString()));
          }
          break;
        default:
          break;
      }
    });
  }
}
