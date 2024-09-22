import 'dart:io';

import 'package:dio/dio.dart';
import 'package:recruitfrontend/constant/api_option.dart';
import 'package:recruitfrontend/model/exception/api_exception.dart';
import 'package:recruitfrontend/model/freezed/content/add_content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/content_entity.dart';
import 'package:recruitfrontend/model/freezed/content/put_content_entity.dart';
import 'package:recruitfrontend/util/dev_log.dart';
import 'package:recruitfrontend/util/logger_util.dart';

class ApiRepository {
  final _dio = Dio(ApiOptions.baseOptions);
  Map<String, dynamic> _checkResponse(Response response) {
    LoggerUtil.logRequestOptions(response.requestOptions);
    final path = response.requestOptions.path;
    final statusCode = response.statusCode ?? 0;
    final result = response.data;

    try {
      if (statusCode == 200 || statusCode == 201 || statusCode == 204) {
        LoggerUtil.logSuccessResponse(response);
        return {
          'data': result,
        };
      } else {
        final apiException = ApiException(
          path: path,
          statusCode: statusCode,
          message: result,
        );
        LoggerUtil.logApiException(apiException);
        throw apiException;
      }
    } on ApiException catch (_) {
      rethrow;
    } catch (e) {
      final apiException = ApiException(
        path: path,
        statusCode: statusCode,
        message: '${response.data}',
      );
      LoggerUtil.logApiException(apiException);
      throw apiException;
    }
  }

  Future<Map<String, dynamic>> _getHeaders({Map addMap = const {}}) async {
    final platform = Platform.isIOS ? 'IOS' : 'ANDROID';

    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Platform': platform,
      ...addMap,
    };
  }

  Future<List<ContentEntity>> getAllContent() async {
    final headers = await _getHeaders();
    _dio.options.headers = headers;

    final response = await _dio.get(
      '/content',
    );
    final result = _checkResponse(response);
    devLog('getAllContent: $result');
    return result['data']
        .map<ContentEntity>((e) => ContentEntity.fromJson(e))
        .toList();
  }

  Future<ContentEntity> addContent(AddContentEntity contentEntity) async {
    final headers = await _getHeaders();
    _dio.options.headers = headers;

    final response = await _dio.post(
      '/content',
      data: contentEntity.toJson(),
    );
    final result = _checkResponse(response);
    return ContentEntity.fromJson(result['data']);
  }

  Future<void> putContent(PutContentEntity content) async {
    final headers = await _getHeaders();
    _dio.options.headers = headers;

    final response = await _dio.put(
      '/content/${content.id}',
      data: content.toJson(),
    );
    _checkResponse(response);
  }

  Future<void> deleteContent(String id) async {
    final headers = await _getHeaders();
    _dio.options.headers = headers;

    final response = await _dio.delete(
      '/content/$id',
    );
    _checkResponse(response);
  }
}
