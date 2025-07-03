import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_model.dart';

part 'book_model.freezed.dart';

part 'book_model.g.dart';

@JsonSerializable()
@freezed
class BookModel with _$BookModel {
  const BookModel({
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
  final int id;
  @override
  final String title;
  @override
  @Default([])
  final List<AuthorModel> authors;
  @override
  @Default([])
  final List<String> summaries;
  @override
  @Default([])
  final List<String> subjects;
  @override
  @Default([])
  final List<String> bookshelves;
  @override
  @Default([])
  final List<String> languages;
  @override
  @JsonKey(name: 'download_count')
  final int downloadCount;
  @Default({})
  final Map<String, String> formats;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  final bool? copyright;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, Object?> toJson() => _$BookModelToJson(this);
}
