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
  @JsonKey(name: 'download_count')
  int get downloadCount;
  Map<String, String> get formats;
  @JsonKey(name: 'media_type')
  String? get mediaType;
  bool? get copyright;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookModelCopyWith<BookModel> get copyWith =>
      _$BookModelCopyWithImpl<BookModel>(this as BookModel, _$identity);

  /// Serializes this BookModel to a JSON map.
  Map<String, dynamic> toJson();

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
      @JsonKey(name: 'download_count') int downloadCount,
      Map<String, String> formats,
      @JsonKey(name: 'media_type') String? mediaType,
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
    return _then(_self.copyWith(
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

/// @nodoc
@JsonSerializable()
class _BookModel implements BookModel {
  const _BookModel(
      {required this.id,
      required this.title,
      final List<AuthorModel> authors = const [],
      final List<String> summaries = const [],
      final List<String> subjects = const [],
      final List<String> bookshelves = const [],
      final List<String> languages = const [],
      @JsonKey(name: 'download_count') required this.downloadCount,
      final Map<String, String> formats = const {},
      @JsonKey(name: 'media_type') this.mediaType,
      this.copyright})
      : _authors = authors,
        _summaries = summaries,
        _subjects = subjects,
        _bookshelves = bookshelves,
        _languages = languages,
        _formats = formats;
  factory _BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  final List<AuthorModel> _authors;
  @override
  @JsonKey()
  List<AuthorModel> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  final List<String> _summaries;
  @override
  @JsonKey()
  List<String> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  final List<String> _subjects;
  @override
  @JsonKey()
  List<String> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  final List<String> _bookshelves;
  @override
  @JsonKey()
  List<String> get bookshelves {
    if (_bookshelves is EqualUnmodifiableListView) return _bookshelves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookshelves);
  }

  final List<String> _languages;
  @override
  @JsonKey()
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey(name: 'download_count')
  final int downloadCount;
  final Map<String, String> _formats;
  @override
  @JsonKey()
  Map<String, String> get formats {
    if (_formats is EqualUnmodifiableMapView) return _formats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formats);
  }

  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  final bool? copyright;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookModelCopyWith<_BookModel> get copyWith =>
      __$BookModelCopyWithImpl<_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            const DeepCollectionEquality()
                .equals(other._bookshelves, _bookshelves) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            const DeepCollectionEquality().equals(other._formats, _formats) &&
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
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(_summaries),
      const DeepCollectionEquality().hash(_subjects),
      const DeepCollectionEquality().hash(_bookshelves),
      const DeepCollectionEquality().hash(_languages),
      downloadCount,
      const DeepCollectionEquality().hash(_formats),
      mediaType,
      copyright);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, authors: $authors, summaries: $summaries, subjects: $subjects, bookshelves: $bookshelves, languages: $languages, downloadCount: $downloadCount, formats: $formats, mediaType: $mediaType, copyright: $copyright)';
  }
}

/// @nodoc
abstract mixin class _$BookModelCopyWith<$Res>
    implements $BookModelCopyWith<$Res> {
  factory _$BookModelCopyWith(
          _BookModel value, $Res Function(_BookModel) _then) =
      __$BookModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      List<AuthorModel> authors,
      List<String> summaries,
      List<String> subjects,
      List<String> bookshelves,
      List<String> languages,
      @JsonKey(name: 'download_count') int downloadCount,
      Map<String, String> formats,
      @JsonKey(name: 'media_type') String? mediaType,
      bool? copyright});
}

/// @nodoc
class __$BookModelCopyWithImpl<$Res> implements _$BookModelCopyWith<$Res> {
  __$BookModelCopyWithImpl(this._self, this._then);

  final _BookModel _self;
  final $Res Function(_BookModel) _then;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_BookModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _self._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<AuthorModel>,
      summaries: null == summaries
          ? _self._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subjects: null == subjects
          ? _self._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookshelves: null == bookshelves
          ? _self._bookshelves
          : bookshelves // ignore: cast_nullable_to_non_nullable
              as List<String>,
      languages: null == languages
          ? _self._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downloadCount: null == downloadCount
          ? _self.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      formats: null == formats
          ? _self._formats
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
