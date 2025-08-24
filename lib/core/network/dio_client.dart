import 'package:dio/dio.dart';
import 'package:flutter_core_clean_mvvm/core/network/exceptions/dio_client_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient(this._dio, {List<Interceptor>? interceptors}) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Dio get instance => _dio;

  void setHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      return DioClientException(
        error.message ?? 'Unknown Dio error',
        statusCode: error.response?.statusCode,
      );
    } else {
      return DioClientException('Unexpected error: $error');
    }
  }
}
