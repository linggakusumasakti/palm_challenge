import 'package:equatable/equatable.dart';

import '../../data/models/author_model.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final List<AuthorModel> authors;
  final List<String> summaries;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final int downloadCount;
  final Map<String, String> formats;
  final String? mediaType;
  final bool? copyright;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.downloadCount,
    required this.formats,
    this.mediaType,
    this.copyright,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        authors,
        summaries,
        subjects,
        bookshelves,
        languages,
        downloadCount,
        formats,
        mediaType,
        copyright
      ];
}
