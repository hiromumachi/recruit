import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recruitfrontend/model/exception/api_exception.dart';

class ErrorUtil {
  static String getRecordApiException(ApiException error) {
    return 'Error: ${error.string}\nMessage: ${getApiException(error)}';
  }

  static String getApiException(ApiException error) {
    return '【ErrorCode: ${error.statusCode}】\n${error.message}';
  }

  static String getRecordDioException(DioException error) {
    return 'Error: $error\nMessage: ${getDioException(error)}';
  }

  static String getDioException(DioException error) {
    final errorTypeText = '【Error: ${error.type.name}】\n';
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return '$errorTypeText接続がタイムアウトしました。しばらくしてから再度お試しください。';
      case DioExceptionType.sendTimeout:
        return '$errorTypeText送信がタイムアウトしました。もう一度試してください。問題が解決しない場合は、ネットワーク接続を確認してください。';
      case DioExceptionType.receiveTimeout:
        return '$errorTypeText受信がタイムアウトしました。もう一度試してください。問題が解決しない場合は、ネットワーク接続を確認してください。';
      case DioExceptionType.badCertificate:
        return '$errorTypeTextサーバーの証明書に問題があります。接続を継続する前に、ネットワーク接続が安全であることを確認してください。';
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
          case 401:
          case 403:
            return '$errorTypeText認証に失敗しました。正しいアクセス許可を持っていることを確認してください。';
          case 404:
            return '$errorTypeTextページが見つかりません。入力したURLが正しいかどうかを確認してください。';
          case 408:
            return '$errorTypeTextリクエストがタイムアウトしました。もう一度試してください。問題が解決しない場合は、ネットワーク接続を確認してください。';
          case 409:
            return '$errorTypeText競合が発生しました。もう一度やり直してください。';
          case 500:
            return '$errorTypeTextサーバーでエラーが発生しました。もう一度試してください。問題が解決しない場合は、システム管理者に問い合わせてください。';
          case 503:
            return '$errorTypeTextサービスを利用できません。しばらくしてから再度試してください。問題が解決しない場合は、システム管理者に問い合わせてください。';
          default:
            break;
        }
      case DioExceptionType.cancel:
        return '${errorTypeText}APIリクエストがキャンセルされました。もう一度試してください。問題が解決しない場合は、システム管理者に問い合わせてください。';
      case DioExceptionType.connectionError:
        return '$errorTypeText接続エラーが発生しました。ネットワーク接続を確認して、もう一度試してください。問題が解決しない場合は、システム管理者に問い合わせてください。';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return '$errorTypeText接続エラーが発生しました。ネットワーク接続を確認して、もう一度試してください。問題が解決しない場合は、システム管理者に問い合わせてください。';
        }
    }
    return '$errorTypeText${error.error}';
  }
}
