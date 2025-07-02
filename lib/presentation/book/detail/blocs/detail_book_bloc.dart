import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:palm_challenge/core/domain/usecases/is_book_liked.dart';
import 'package:palm_challenge/core/domain/usecases/like_book.dart';

import '../../../../core/domain/entities/book.dart';

part 'detail_book_bloc.freezed.dart';

part 'detail_book_event.dart';

part 'detail_book_state.dart';

class DetailBookBloc extends Bloc<DetailBookEvent, DetailBookState> {
  final LikeBook likeBook;
  final IsBookLiked isBookLiked;

  DetailBookBloc(this.likeBook, this.isBookLiked)
      : super(DetailBookState.initial()) {
    on<_LikeBook>((event, emit) async {
      emit(const DetailBookState.loading());
      try {
        await likeBook.call(event.book);
        final isLiked = await isBookLiked.call(event.book.id);
        emit(DetailBookState.success(isLiked));
      } catch (e) {
        emit(DetailBookState.error(e.toString()));
      }
    });
    on<_CheckLikeStatus>((event, emit) async {
      try {
        final isLiked = await isBookLiked.call(event.bookId);
        emit(DetailBookState.success(isLiked));
      } catch (e) {
        emit(DetailBookState.error(e.toString()));
      }
    });
  }
}
