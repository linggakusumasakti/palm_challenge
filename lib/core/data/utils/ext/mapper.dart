import 'dart:convert';

import '../../../domain/entities/book.dart';
import '../../models/author_model.dart';
import '../../models/book_model.dart';
import '../../models/book_table_model.dart';

extension BookModelMapper on BookModel {
  BookTableModel toTableModel() {
    return BookTableModel(
      id: id,
      title: title,
      authorsJson: jsonEncode(authors.map((e) => e.toJson()).toList()),
      summariesJson: jsonEncode(summaries),
      subjectsJson: jsonEncode(subjects),
      bookshelvesJson: jsonEncode(bookshelves),
      languagesJson: jsonEncode(languages),
      downloadCount: downloadCount,
      formatsJson: jsonEncode(formats),
      mediaType: mediaType,
      copyright: (copyright ?? false) ? 1 : 0,
    );
  }
}

extension BookModelToEntity on BookModel {
  Book toEntity() {
    return Book(
      id: id,
      title: title,
      authors: authors,
      summaries: summaries,
      subjects: subjects,
      bookshelves: bookshelves,
      languages: languages,
      downloadCount: downloadCount,
      formats: formats,
      mediaType: mediaType,
      copyright: copyright,
    );
  }
}

extension BookTableModelToEntity on BookTableModel {
  Book toEntity() {
    return Book(
      id: id,
      title: title,
      authors: (jsonDecode(authorsJson) as List)
          .map((e) => AuthorModel.fromJson(e))
          .toList(),
      summaries: List<String>.from(jsonDecode(summariesJson)),
      subjects: List<String>.from(jsonDecode(subjectsJson)),
      bookshelves: List<String>.from(jsonDecode(bookshelvesJson)),
      languages: List<String>.from(jsonDecode(languagesJson)),
      downloadCount: downloadCount,
      formats: Map<String, String>.from(jsonDecode(formatsJson)),
      mediaType: mediaType,
      copyright: copyright == 1,
    );
  }
}

extension BookToEntity on Book {
  BookTableModel toEntity() {
    return BookTableModel(
      id: id,
      title: title,
      authorsJson: jsonEncode(authors.map((e) => e.toJson()).toList()),
      summariesJson: jsonEncode(summaries),
      subjectsJson: jsonEncode(subjects),
      bookshelvesJson: jsonEncode(bookshelves),
      languagesJson: jsonEncode(languages),
      downloadCount: downloadCount,
      formatsJson: jsonEncode(formats),
      mediaType: mediaType,
      copyright: (copyright ?? false) ? 1 : 0,
    );
  }
}

extension BookModelListMapper on List<BookModel> {
  List<BookTableModel> toTableModelList() {
    return map((book) => book.toTableModel()).toList();
  }
}
