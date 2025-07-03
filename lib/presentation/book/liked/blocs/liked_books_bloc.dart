import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palm_challenge/core/domain/usecases/get_liked_books.dart';

import '../../../../core/domain/entities/book.dart';

part 'liked_books_bloc.freezed.dart';

part 'liked_books_event.dart';

part 'liked_books_state.dart';

class LikedBooksBloc extends Bloc<LikedBooksEvent, LikedBooksState> {
  final GetLikedBooks getLikedBooks;

  LikedBooksBloc(this.getLikedBooks) : super(LikedBooksState.initial()) {
    on<_GetLikedBooks>((event, emit) async {
      emit(LikedBooksState.loading());
      final books = await getLikedBooks.call();
      if (books.isEmpty) {
        emit(LikedBooksState.empty());
      } else {
        emit(LikedBooksState.loaded(books: books));
      }
    });
  }
}
