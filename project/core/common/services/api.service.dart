import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:{{title}}/dependencies.dart';
import 'package:{{title}}/features/auth/repositories/auth.repository.dart';

import '../../config/api.config.dart';
import 'token.service.dart';

class APIService {
  final Dio _dio = Dio();

  APIService() {
    _dio.options.baseUrl = APIConfig.baseUrl;
    _dio.options.headers.addEntries([
      const MapEntry('Content-Type', 'application/json'),
    ]);
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(printRequestHeaders: true),
      ),
    );
  }

  Dio get dio => _dio;
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log(err.message ?? err.toString());
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final tokens = await getIt.get<AuthRepository>().refresh();
      await TokenService.save(access: tokens.access, refresh: tokens.refresh);
      _retry(err.requestOptions);
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await TokenService.accessToken;
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return getIt.get<APIService>().dio.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        );
  }
}
