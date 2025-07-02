import 'package:flutter/material.dart';
import 'package:palm_challenge/core/data/utils/ext/num.dart';
import 'package:palm_challenge/core/domain/entities/book.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final Book book;

  const BookDetailBottomSheet({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final authorName =
        book.authors.isNotEmpty ? book.authors.first.name : "Unknown";
    final summary = book.summaries.isNotEmpty
        ? book.summaries.first
        : "No description available.";
    final language =
        book.languages.isNotEmpty ? book.languages.first.toUpperCase() : '-';

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  book.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'by $authorName',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _InfoTile(
                        title: book.downloadCount.toFormattedNumber(),
                        subtitle: 'Download Count'),
                    _verticalDivider(),
                    _InfoTile(title: language, subtitle: 'Language'),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  summary,
                  style: const TextStyle(height: 1.5, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _verticalDivider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 32,
          child: VerticalDivider(thickness: 1),
        ),
      );
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InfoTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
