import 'package:flutter/material.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';

import '../widgets/book_detail_bottom_sheet.dart';
import '../widgets/book_header.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: BookHeader(book: book)),
          BookDetailBottomSheet(book: book),
        ],
      ),
    );
  }
}
