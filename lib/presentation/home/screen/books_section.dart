import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';
import 'package:palm_challenge/routes/routes.dart';

import '../blocs/home_bloc.dart';
import '../widgets/book_card.dart';

class BooksSection extends StatefulWidget {
  const BooksSection(
      {super.key, required this.books, this.hasReachedMax, this.query});

  final List<Book> books;
  final bool? hasReachedMax;
  final String? query;

  @override
  BookSectionState createState() => BookSectionState();
}

class BookSectionState extends State<BooksSection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HomeBloc>().add(HomeEvent.loadMore(query: widget.query));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 100);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: (widget.hasReachedMax ?? false)
          ? widget.books.length
          : widget.books.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= widget.books.length) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ));
        }
        final book = widget.books[index];
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.detail, arguments: book);
            },
            child: BookCard(book: book));
      },
    );
  }
}
