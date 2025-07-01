import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/entities/book.dart';
import '../../../core/domain/usecases/get_books.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBooks getBooks;
  bool _isFetching = false;

  HomeBloc(this.getBooks) : super(const HomeState.initial()) {
    on<_FetchBook>((event, emit) async {
      if (_isFetching) return;

      final currentState = state;
      if (currentState is Loaded && currentState.hasReachedMax) return;

      _isFetching = true;
      try {
        if (currentState is Initial || currentState is Loading) {
          await _loadInitial(emit);
        } else if (currentState is Loaded) {
          await _loadMore(emit, currentState);
        }
      } catch (e) {
        emit(HomeState.error(e.toString()));
      } finally {
        _isFetching = false;
      }
    });
  }

  Future<void> _loadInitial(Emitter<HomeState> emit) async {
    final books = await getBooks(page: 1);
    emit(HomeState.loaded(
      books: books,
      page: 1,
      hasReachedMax: false,
    ));
  }

  Future<void> _loadMore(Emitter<HomeState> emit, Loaded currentState) async {
    final nextPage = currentState.page + 1;
    final books = await getBooks(page: nextPage);

    if (books.isEmpty) {
      emit(currentState.copyWith(hasReachedMax: true));
    } else {
      emit(currentState.copyWith(
        books: [...currentState.books, ...books],
        page: nextPage,
        hasReachedMax: false,
      ));
    }
  }
}
