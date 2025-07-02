import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/book.dart';
import '../blocs/detail_book_bloc.dart';

class BookHeader extends StatelessWidget {
  final Book book;

  const BookHeader({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 340,
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: book.formats['image/jpeg'] ?? '',
            height: 260,
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image, size: 80),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                BlocBuilder<DetailBookBloc, DetailBookState>(
                  builder: (context, state) {
                    final isLiked = state is Success && state.isLiked;
                    return InkWell(
                      onTap: () {
                        context
                            .read<DetailBookBloc>()
                            .add(DetailBookEvent.likeBook(book));
                      },
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
