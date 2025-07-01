// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookTableModel {
  int get id;
  String get title;
  String get authorsJson;
  String get summariesJson;
  String get subjectsJson;
  String get bookshelvesJson;
  String get languagesJson;
  int get downloadCount;
  String get formatsJson;
  String? get mediaType;
  int? get copyright;

  /// Create a copy of BookTableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookTableModelCopyWith<BookTableModel> get copyWith =>
      _$BookTableModelCopyWithImpl<BookTableModel>(
          this as BookTableModel, _$identity);

  /// Serializes this BookTableModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookTableModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.authorsJson, authorsJson) ||
                other.authorsJson == authorsJson) &&
            (identical(other.summariesJson, summariesJson) ||
                other.summariesJson == summariesJson) &&
            (identical(other.subjectsJson, subjectsJson) ||
                other.subjectsJson == subjectsJson) &&
            (identical(other.bookshelvesJson, bookshelvesJson) ||
                other.bookshelvesJson == bookshelvesJson) &&
            (identical(other.languagesJson, languagesJson) ||
                other.languagesJson == languagesJson) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.formatsJson, formatsJson) ||
                other.formatsJson == formatsJson) &&
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
      authorsJson,
      summariesJson,
      subjectsJson,
      bookshelvesJson,
      languagesJson,
      downloadCount,
      formatsJson,
      mediaType,
      copyright);

  @override
  String toString() {
    return 'BookTableModel(id: $id, title: $title, authorsJson: $authorsJson, summariesJson: $summariesJson, subjectsJson: $subjectsJson, bookshelvesJson: $bookshelvesJson, languagesJson: $languagesJson, downloadCount: $downloadCount, formatsJson: $formatsJson, mediaType: $mediaType, copyright: $copyright)';
  }
}

/// @nodoc
abstract mixin class $BookTableModelCopyWith<$Res> {
  factory $BookTableModelCopyWith(
          BookTableModel value, $Res Function(BookTableModel) _then) =
      _$BookTableModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String authorsJson,
      String summariesJson,
      String subjectsJson,
      String bookshelvesJson,
      String languagesJson,
      int downloadCount,
      String formatsJson,
      String? mediaType,
      int? copyright});
}

/// @nodoc
class _$BookTableModelCopyWithImpl<$Res>
    implements $BookTableModelCopyWith<$Res> {
  _$BookTableModelCopyWithImpl(this._self, this._then);

  final BookTableModel _self;
  final $Res Function(BookTableModel) _then;

  /// Create a copy of BookTableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? authorsJson = null,
    Object? summariesJson = null,
    Object? subjectsJson = null,
    Object? bookshelvesJson = null,
    Object? languagesJson = null,
    Object? downloadCount = null,
    Object? formatsJson = null,
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
      authorsJson: null == authorsJson
          ? _self.authorsJson
          : authorsJson // ignore: cast_nullable_to_non_nullable
              as String,
      summariesJson: null == summariesJson
          ? _self.summariesJson
          : summariesJson // ignore: cast_nullable_to_non_nullable
              as String,
      subjectsJson: null == subjectsJson
          ? _self.subjectsJson
          : subjectsJson // ignore: cast_nullable_to_non_nullable
              as String,
      bookshelvesJson: null == bookshelvesJson
          ? _self.bookshelvesJson
          : bookshelvesJson // ignore: cast_nullable_to_non_nullable
              as String,
      languagesJson: null == languagesJson
          ? _self.languagesJson
          : languagesJson // ignore: cast_nullable_to_non_nullable
              as String,
      downloadCount: null == downloadCount
          ? _self.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      formatsJson: null == formatsJson
          ? _self.formatsJson
          : formatsJson // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: freezed == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _self.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookTableModel implements BookTableModel {
  const _BookTableModel(
      {required this.id,
      required this.title,
      required this.authorsJson,
      required this.summariesJson,
      required this.subjectsJson,
      required this.bookshelvesJson,
      required this.languagesJson,
      required this.downloadCount,
      required this.formatsJson,
      this.mediaType,
      this.copyright});
  factory _BookTableModel.fromJson(Map<String, dynamic> json) =>
      _$BookTableModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String authorsJson;
  @override
  final String summariesJson;
  @override
  final String subjectsJson;
  @override
  final String bookshelvesJson;
  @override
  final String languagesJson;
  @override
  final int downloadCount;
  @override
  final String formatsJson;
  @override
  final String? mediaType;
  @override
  final int? copyright;

  /// Create a copy of BookTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookTableModelCopyWith<_BookTableModel> get copyWith =>
      __$BookTableModelCopyWithImpl<_BookTableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookTableModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookTableModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.authorsJson, authorsJson) ||
                other.authorsJson == authorsJson) &&
            (identical(other.summariesJson, summariesJson) ||
                other.summariesJson == summariesJson) &&
            (identical(other.subjectsJson, subjectsJson) ||
                other.subjectsJson == subjectsJson) &&
            (identical(other.bookshelvesJson, bookshelvesJson) ||
                other.bookshelvesJson == bookshelvesJson) &&
            (identical(other.languagesJson, languagesJson) ||
                other.languagesJson == languagesJson) &&
            (identical(other.downloadCount, downloadCount) ||
                other.downloadCount == downloadCount) &&
            (identical(other.formatsJson, formatsJson) ||
                other.formatsJson == formatsJson) &&
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
      authorsJson,
      summariesJson,
      subjectsJson,
      bookshelvesJson,
      languagesJson,
      downloadCount,
      formatsJson,
      mediaType,
      copyright);

  @override
  String toString() {
    return 'BookTableModel(id: $id, title: $title, authorsJson: $authorsJson, summariesJson: $summariesJson, subjectsJson: $subjectsJson, bookshelvesJson: $bookshelvesJson, languagesJson: $languagesJson, downloadCount: $downloadCount, formatsJson: $formatsJson, mediaType: $mediaType, copyright: $copyright)';
  }
}

/// @nodoc
abstract mixin class _$BookTableModelCopyWith<$Res>
    implements $BookTableModelCopyWith<$Res> {
  factory _$BookTableModelCopyWith(
          _BookTableModel value, $Res Function(_BookTableModel) _then) =
      __$BookTableModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String authorsJson,
      String summariesJson,
      String subjectsJson,
      String bookshelvesJson,
      String languagesJson,
      int downloadCount,
      String formatsJson,
      String? mediaType,
      int? copyright});
}

/// @nodoc
class __$BookTableModelCopyWithImpl<$Res>
    implements _$BookTableModelCopyWith<$Res> {
  __$BookTableModelCopyWithImpl(this._self, this._then);

  final _BookTableModel _self;
  final $Res Function(_BookTableModel) _then;

  /// Create a copy of BookTableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? authorsJson = null,
    Object? summariesJson = null,
    Object? subjectsJson = null,
    Object? bookshelvesJson = null,
    Object? languagesJson = null,
    Object? downloadCount = null,
    Object? formatsJson = null,
    Object? mediaType = freezed,
    Object? copyright = freezed,
  }) {
    return _then(_BookTableModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authorsJson: null == authorsJson
          ? _self.authorsJson
          : authorsJson // ignore: cast_nullable_to_non_nullable
              as String,
      summariesJson: null == summariesJson
          ? _self.summariesJson
          : summariesJson // ignore: cast_nullable_to_non_nullable
              as String,
      subjectsJson: null == subjectsJson
          ? _self.subjectsJson
          : subjectsJson // ignore: cast_nullable_to_non_nullable
              as String,
      bookshelvesJson: null == bookshelvesJson
          ? _self.bookshelvesJson
          : bookshelvesJson // ignore: cast_nullable_to_non_nullable
              as String,
      languagesJson: null == languagesJson
          ? _self.languagesJson
          : languagesJson // ignore: cast_nullable_to_non_nullable
              as String,
      downloadCount: null == downloadCount
          ? _self.downloadCount
          : downloadCount // ignore: cast_nullable_to_non_nullable
              as int,
      formatsJson: null == formatsJson
          ? _self.formatsJson
          : formatsJson // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: freezed == mediaType
          ? _self.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      copyright: freezed == copyright
          ? _self.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
