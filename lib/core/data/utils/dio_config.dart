import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_interceptors.dart';

class DioConfig {
  final Dio dio;

  DioConfig({required String baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )) {
    dio.interceptors.add(ApiInterceptors());
  }

  Future<Response?> get({
    required String endpoint,
    String? contentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType ?? "application/json",
          },
          validateStatus: (status) {
            return (status ?? 0) < 500;
          },
        ),
      );
    } on DioException catch (e) {
      log("❌ GET Error: ${e.message}");
      return null;
    }
  }

  Future<Response?> post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    try {
      return await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType ?? "application/json",
          },
          validateStatus: (status) {
            return (status ?? 0) < 500;
          },
        ),
      );
    } on DioException catch (e) {
      log("❌ POST Error: ${e.message}");
      return null;
    }
  }
}
