import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_model.freezed.dart';

part 'author_model.g.dart';

@JsonSerializable()
@freezed
class AuthorModel with _$AuthorModel {
  const AuthorModel({
    required this.name,
    this.birthYear,
    this.deathYear,
  });

  @override
  final String name;
  @override
  @JsonKey(name: 'birth_year')
  final int? birthYear;
  @override
  @JsonKey(name: 'death_year')
  final int? deathYear;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, Object?> toJson() => _$AuthorModelToJson(this);
}
