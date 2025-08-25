/// Custom exception class for handling Dio client errors.
class DioClientException implements Exception {
  final int? statusCode;
  final String message;

  static const String networkUnknownError = 'Network unknown error';
  static const String networkError = 'Network error';
  static const String dioClientExceptionName = '[DioClientException]';

  DioClientException(this.message, {this.statusCode});

  factory DioClientException.unknown([int? statusCode]) =>
      DioClientException(networkUnknownError, statusCode: statusCode);

  factory DioClientException.network([int? statusCode]) =>
      DioClientException(networkError, statusCode: statusCode);

  @override
  String toString() => '$dioClientExceptionName $statusCode: $message';
}
