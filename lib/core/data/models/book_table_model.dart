import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_table_model.freezed.dart';
part 'book_table_model.g.dart';

@freezed
abstract class BookTableModel with _$BookTableModel {
  const factory BookTableModel({
    required int id,
    required String title,
    required String authorsJson,
    required String summariesJson,
    required String subjectsJson,
    required String bookshelvesJson,
    required String languagesJson,
    required int downloadCount,
    required String formatsJson,
    String? mediaType,
    int? copyright,
  }) = _BookTableModel;

  factory BookTableModel.fromJson(Map<String, dynamic> json) =>
      _$BookTableModelFromJson(json);
}
