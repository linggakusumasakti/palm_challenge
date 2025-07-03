// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      authors: (json['authors'] as List<dynamic>)
          .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      summaries:
          (json['summaries'] as List<dynamic>).map((e) => e as String).toList(),
      subjects:
          (json['subjects'] as List<dynamic>).map((e) => e as String).toList(),
      bookshelves: (json['bookshelves'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      downloadCount: (json['download_count'] as num).toInt(),
      formats: Map<String, String>.from(json['formats'] as Map),
      mediaType: json['media_type'] as String?,
      copyright: json['copyright'] as bool?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors,
      'summaries': instance.summaries,
      'subjects': instance.subjects,
      'bookshelves': instance.bookshelves,
      'languages': instance.languages,
      'download_count': instance.downloadCount,
      'formats': instance.formats,
      'media_type': instance.mediaType,
      'copyright': instance.copyright,
    };
