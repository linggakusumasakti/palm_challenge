import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/presentation/book/detail/blocs/detail_book_bloc.dart';

import '../../liked/blocs/liked_books_bloc.dart';
import '../widgets/book_detail_bottom_sheet.dart';
import '../widgets/book_header.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<DetailBookBloc>()
        ..add(DetailBookEvent.checkLikeStatus(book.id)),
      child: BlocListener<DetailBookBloc, DetailBookState>(
        listener: (context, state) {
          if (state is Success) {
            context.read<LikedBooksBloc>().add(LikedBooksEvent.getLikedBooks());
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                  child: BookHeader(
                book: book,
              )),
              BookDetailBottomSheet(book: book),
            ],
          ),
        ),
      ),
    );
  }
}
