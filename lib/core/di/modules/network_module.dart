import 'package:dio/dio.dart';
import 'package:flutter_core_clean_mvvm/core/network/api_constants.dart';
import 'package:flutter_core_clean_mvvm/core/network/interceptors/logger_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: ApiConstants.defaultHeaders,
      responseType: ResponseType.json,
    );
    final dio = Dio(options);
    dio.interceptors.add(LoggerInterceptor());
    return dio;
  }
}
