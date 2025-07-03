// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorModel {
  String get name;
  int? get birthYear;
  int? get deathYear;

  /// Create a copy of AuthorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorModelCopyWith<AuthorModel> get copyWith =>
      _$AuthorModelCopyWithImpl<AuthorModel>(this as AuthorModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.deathYear, deathYear) ||
                other.deathYear == deathYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, birthYear, deathYear);

  @override
  String toString() {
    return 'AuthorModel(name: $name, birthYear: $birthYear, deathYear: $deathYear)';
  }
}

/// @nodoc
abstract mixin class $AuthorModelCopyWith<$Res> {
  factory $AuthorModelCopyWith(
          AuthorModel value, $Res Function(AuthorModel) _then) =
      _$AuthorModelCopyWithImpl;
  @useResult
  $Res call({String name, int? birthYear, int? deathYear});
}

/// @nodoc
class _$AuthorModelCopyWithImpl<$Res> implements $AuthorModelCopyWith<$Res> {
  _$AuthorModelCopyWithImpl(this._self, this._then);

  final AuthorModel _self;
  final $Res Function(AuthorModel) _then;

  /// Create a copy of AuthorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthYear = freezed,
    Object? deathYear = freezed,
  }) {
    return _then(AuthorModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthYear: freezed == birthYear
          ? _self.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      deathYear: freezed == deathYear
          ? _self.deathYear
          : deathYear // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
