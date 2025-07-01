// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookTableModel _$BookTableModelFromJson(Map<String, dynamic> json) =>
    _BookTableModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      authorsJson: json['authorsJson'] as String,
      summariesJson: json['summariesJson'] as String,
      subjectsJson: json['subjectsJson'] as String,
      bookshelvesJson: json['bookshelvesJson'] as String,
      languagesJson: json['languagesJson'] as String,
      downloadCount: (json['downloadCount'] as num).toInt(),
      formatsJson: json['formatsJson'] as String,
      mediaType: json['mediaType'] as String?,
      copyright: (json['copyright'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookTableModelToJson(_BookTableModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authorsJson': instance.authorsJson,
      'summariesJson': instance.summariesJson,
      'subjectsJson': instance.subjectsJson,
      'bookshelvesJson': instance.bookshelvesJson,
      'languagesJson': instance.languagesJson,
      'downloadCount': instance.downloadCount,
      'formatsJson': instance.formatsJson,
      'mediaType': instance.mediaType,
      'copyright': instance.copyright,
    };
