import 'package:dio/dio.dart';
import 'package:recruitfrontend/constant/const_info.dart';

class ApiOptions {
  static const timeoutDuration = Duration(milliseconds: 10000);

  static const statusCodeSuccessMin = 200;
  static const statusCodeErrorMin = 300;

  static get baseOptions {
    return BaseOptions(
      connectTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
      baseUrl: ConstInfo.devBaseUrl,
      contentType: 'application/json',
      validateStatus: (status) {
        return (status ?? 1000) < 1000;
      },
    );
  }
}
