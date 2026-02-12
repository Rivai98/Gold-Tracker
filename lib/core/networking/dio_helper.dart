import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Accept": "application/json", "User-Agent": "Mozilla/5.0"},
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 3,
  }) async {
    int attempt = 0;

    while (true) {
      try {
        return await dio.get(endPoint, queryParameters: queryParameters);
      } on DioException catch (e) {
        final status = e.response?.statusCode;

        if (status == 429 && attempt < maxRetries) {
          attempt++;

          // Retry-After (seconds) لو موجود
          final retryAfterStr = e.response?.headers.value('retry-after');
          final retryAfterSeconds = int.tryParse(retryAfterStr ?? '');

          // fallback: exponential backoff
          final waitSeconds = retryAfterSeconds ?? (1 << attempt); // 2,4,8...
          await Future.delayed(Duration(seconds: waitSeconds));
          continue;
        }

        rethrow;
      }
    }
  }
}
