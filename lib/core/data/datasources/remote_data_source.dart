import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:palm_challenge/core/data/models/book_model.dart';

import '../utils/dio_config.dart';

abstract class RemoteDataSource {
  Future<List<BookModel>> getBooks({int page = 1});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final dioConfig = DioConfig(baseUrl: 'https://gutendex.com');

  @override
  Future<List<BookModel>> getBooks({int page = 1}) async {
    try {
      final response = await dioConfig
          .get(endpoint: '/books', queryParameters: {'page': page});
      if (response?.statusCode == 200) {
        final data = response?.data['results'] as List;
        return data.map((e) => BookModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed get data books');
      }
    } on DioException catch (e) {
      log('error get books $e');
      throw FormatException(e.response?.statusMessage ?? '');
    }
  }
}
