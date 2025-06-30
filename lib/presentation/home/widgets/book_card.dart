import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final author =
        book.authors.isNotEmpty ? book.authors.first.name : 'Unknown';
    final imageUrl = book.formats['image/jpeg'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BookCover(imageUrl: imageUrl),
            const SizedBox(width: 12),
            Expanded(
              child: _BookInfo(
                title: book.title,
                author: author,
                downloadCount: book.downloadCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  final String? imageUrl;

  const _BookCover({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 60,
                height: 90,
                color: Colors.grey.shade300,
                child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (context, url, error) => Container(
                width: 60,
                height: 90,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            )
          : Container(
              width: 60,
              height: 90,
              color: Colors.grey.shade300,
              child: const Icon(Icons.image, color: Colors.white),
            ),
    );
  }
}

class _BookInfo extends StatelessWidget {
  final String title;
  final String author;
  final int downloadCount;

  const _BookInfo({
    required this.title,
    required this.author,
    required this.downloadCount,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.decimalPattern('id');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'by $author',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey[700]),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.download_rounded, color: Colors.black87, size: 16),
            const SizedBox(width: 4),
            Text(
              formatter.format(downloadCount),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
