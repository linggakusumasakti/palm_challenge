// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookModel {
  int get id;
  String get title;
  List<AuthorModel> get authors;
  List<String> get summaries;
  List<String> get subjects;
  List<String> get bookshelves;
  List<String> get languages;
  int get downloadCount;
  Map<String, String> get formats;
  String? get mediaType;
  bool? get copyright;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookModelCopyWith<BookModel> get copyWith =>
      _$BookModelCopyWithImpl<BookModel>(this as BookModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.summaries, summaries) &&
            const DeepCollectionEquality().equals(other.subjects, subjects) &&
            const DeepCollectionEquality()
                .equals(other.bookshelves, bookshelves) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            const DeepCollectionEquality().equals(other.formats, formats) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(authors),
      const DeepCollectionEquality().hash(summaries),
      const DeepCollectionEquality().hash(subjects),
      const DeepCollectionEquality().hash(bookshelves),
      const DeepCollectionEquality().hash(languages),
      downloadCount,
      const DeepCollectionEquality().hash(formats),
      mediaType,
      copyright);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, authors: $authors, summaries: $summaries, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, downloadCount: $downloadCount, formats: $formats, mediaType: $mediaType, copyright: $copyright)';
  }
}

/// @nodoc
abstract mixin class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) _then) =
      _$BookModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      List<AuthorModel> authors,
      List<String> summaries,
      List<String> subjects,
      List<String> bookshelves,
      List<String> languages,
      int downloadCount,
      Map<String, String> formats,
      String? mediaType,
      bool? copyright});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res> implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._self, this._then);

  final BookModel _self;
  final $Res Function(BookModel) _then;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? authors = null,
    Object? summaries = null,
    Object? subjects = null,
    Object? bookshelves = null,
    Object? languages = null,
    Object? downloadCount = null,
    Object? formats = null,
    Object? mediaType = freezed,
    Object? copyright = freezed,
  }) {
    return _then(BookModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      summaries: null == summaries
          ? _self.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subjects: null == subjects
          ? _self.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookshelves: null == bookshelves
          ? _self.bookshelves
          : bookshelves // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downloadCount: null == downloadCount
          ? _self.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      formats: null == formats
          ? _self.formats
          : formats // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      mediaType: freezed == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _self.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
