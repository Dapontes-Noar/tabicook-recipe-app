class DioClientException implements Exception {
  final int? statusCode;
  final String message;

  DioClientException(this.message, {this.statusCode});

  @override
  String toString() => '[DioClientException] $statusCode: $message';
}
