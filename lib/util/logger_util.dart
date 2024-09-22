import 'package:dio/dio.dart';
import 'package:recruitfrontend/constant/logger_info.dart';
import 'package:recruitfrontend/model/exception/api_exception.dart';
import 'package:recruitfrontend/util/error_util.dart';

class LoggerUtil {
  static final _logger = LoggerInfo.instance;

  static void logRequestOptions(RequestOptions requestOptions) {
    final path = requestOptions.path;
    final headers = requestOptions.headers;
    final queryParameters = requestOptions.queryParameters;
    final data = requestOptions.data;
    var logTextList = ['🔍path: $path'];
    if (headers.isNotEmpty) logTextList.add('📒headers: $headers');
    if (queryParameters.isNotEmpty) {
      logTextList.add('📌queryParameters: $queryParameters');
    }
    if (data != null) logTextList.add('📦data: $data');
    _logger.d(logTextList.join('\n'));
  }

  static void logSuccessResponse(Response response) {
    _logger.i(
        '✅path : ${response.requestOptions.path}\n📁response : ${response.data}');
  }

  static void logWarningError(Object error) {
    _logger.w(error);
  }

  static void logError(Object error) {
    _logger.e(error);
  }

  static void logApiException(ApiException exception) {
    logError(ErrorUtil.getRecordApiException(exception));
  }

  static void logFatalError(Object error) {
    _logger.f(error);
  }
}
