class ApiException implements Exception {
  const ApiException({
    this.path,
    this.statusCode,
    this.message,
  });
  final String? path;
  final int? statusCode;
  final String? message;

  String get string {
    return 'ApiException(path: $path, statusCode: $statusCode,  message: $message)';
  }
}
