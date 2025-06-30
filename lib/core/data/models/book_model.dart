import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_model.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
abstract class BookModel with _$BookModel {
  const factory BookModel({
    required int id,
    required String title,
    @Default([]) List<AuthorModel> authors,
    @Default([]) List<String> summaries,
    @Default([]) List<String> subjects,
    @Default([]) List<String> bookshelves,
    @Default([]) List<String> languages,
    @JsonKey(name: 'download_count') required int downloadCount,
    @Default({}) Map<String, String> formats,
    @JsonKey(name: 'media_type') String? mediaType,
    bool? copyright,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
