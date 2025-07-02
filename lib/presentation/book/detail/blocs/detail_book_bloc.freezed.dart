// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_book_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailBookEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DetailBookEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DetailBookEvent()';
  }
}

/// @nodoc
class $DetailBookEventCopyWith<$Res> {
  $DetailBookEventCopyWith(
      DetailBookEvent _, $Res Function(DetailBookEvent) __);
}

/// @nodoc

class _LikeBook implements DetailBookEvent {
  const _LikeBook(this.book);

  final Book book;

  /// Create a copy of DetailBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LikeBookCopyWith<_LikeBook> get copyWith =>
      __$LikeBookCopyWithImpl<_LikeBook>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeBook &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  @override
  String toString() {
    return 'DetailBookEvent.likeBook(book: $book)';
  }
}

/// @nodoc
abstract mixin class _$LikeBookCopyWith<$Res>
    implements $DetailBookEventCopyWith<$Res> {
  factory _$LikeBookCopyWith(_LikeBook value, $Res Function(_LikeBook) _then) =
      __$LikeBookCopyWithImpl;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$LikeBookCopyWithImpl<$Res> implements _$LikeBookCopyWith<$Res> {
  __$LikeBookCopyWithImpl(this._self, this._then);

  final _LikeBook _self;
  final $Res Function(_LikeBook) _then;

  /// Create a copy of DetailBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? book = null,
  }) {
    return _then(_LikeBook(
      null == book
          ? _self.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _CheckLikeStatus implements DetailBookEvent {
  const _CheckLikeStatus(this.bookId);

  final int bookId;

  /// Create a copy of DetailBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckLikeStatusCopyWith<_CheckLikeStatus> get copyWith =>
      __$CheckLikeStatusCopyWithImpl<_CheckLikeStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckLikeStatus &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookId);

  @override
  String toString() {
    return 'DetailBookEvent.checkLikeStatus(bookId: $bookId)';
  }
}

/// @nodoc
abstract mixin class _$CheckLikeStatusCopyWith<$Res>
    implements $DetailBookEventCopyWith<$Res> {
  factory _$CheckLikeStatusCopyWith(
          _CheckLikeStatus value, $Res Function(_CheckLikeStatus) _then) =
      __$CheckLikeStatusCopyWithImpl;
  @useResult
  $Res call({int bookId});
}

/// @nodoc
class __$CheckLikeStatusCopyWithImpl<$Res>
    implements _$CheckLikeStatusCopyWith<$Res> {
  __$CheckLikeStatusCopyWithImpl(this._self, this._then);

  final _CheckLikeStatus _self;
  final $Res Function(_CheckLikeStatus) _then;

  /// Create a copy of DetailBookEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookId = null,
  }) {
    return _then(_CheckLikeStatus(
      null == bookId
          ? _self.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DetailBookState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DetailBookState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DetailBookState()';
  }
}

/// @nodoc
class $DetailBookStateCopyWith<$Res> {
  $DetailBookStateCopyWith(
      DetailBookState _, $Res Function(DetailBookState) __);
}

/// @nodoc

class _Initial implements DetailBookState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DetailBookState.initial()';
  }
}

/// @nodoc

class _Loading implements DetailBookState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DetailBookState.loading()';
  }
}

/// @nodoc

class Success implements DetailBookState {
  const Success(this.isLiked);

  final bool isLiked;

  /// Create a copy of DetailBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLiked);

  @override
  String toString() {
    return 'DetailBookState.success(isLiked: $isLiked)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $DetailBookStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({bool isLiked});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of DetailBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLiked = null,
  }) {
    return _then(Success(
      null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _Error implements DetailBookState {
  const _Error(this.message);

  final String message;

  /// Create a copy of DetailBookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DetailBookState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $DetailBookStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of DetailBookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
