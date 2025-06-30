import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';
part 'author_model.g.dart';

@freezed
abstract class AuthorModel with _$AuthorModel {
  const factory AuthorModel({
    required String name,
    @JsonKey(name: 'birth_year') int? birthYear,
    @JsonKey(name: 'death_year') int? deathYear,
  }) = _AuthorModel;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);
}
