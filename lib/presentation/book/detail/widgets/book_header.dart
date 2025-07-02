import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';

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
                    child: Icon(Icons.arrow_back)),
                Icon(Icons.favorite_border),
              ],
            ),
          ),
        )
      ],
    );
  }
}
