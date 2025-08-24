import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      final buffer = StringBuffer()
        ..writeln('--- [DIO REQUEST] ---')
        ..writeln('URI: ${options.uri}')
        ..writeln('Method: ${options.method}')
        ..writeln('Headers: ${options.headers}')
        ..writeln('Query Parameters: ${options.queryParameters}')
        ..writeln('Body: ${options.data}')
        ..writeln('---------------------');
      print(buffer.toString());
    }
    //options.headers.addAll({"X-RapidAPI-Key": "YOUR_API_KEY"});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      final buffer = StringBuffer()
        ..writeln('--- [DIO RESPONSE] ---')
        ..writeln('URI: ${response.requestOptions.uri}')
        ..writeln('Status Code: ${response.statusCode}')
        ..writeln('Headers: ${response.headers}')
        ..writeln('Data: ${response.data}')
        ..writeln('----------------------');
      print(buffer.toString());
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      final buffer = StringBuffer()
        ..writeln('--- [DIO ERROR] ---')
        ..writeln('URI: ${err.requestOptions.uri}')
        ..writeln('Message: ${err.message}')
        ..writeln('Status Code: ${err.response?.statusCode}')
        ..writeln('Headers: ${err.response?.headers}')
        ..writeln('Data: ${err.response?.data}')
        ..writeln('--------------------');
      print(buffer.toString());
    }
    handler.next(err);
  }
}
