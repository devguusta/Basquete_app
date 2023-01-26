import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../const/urls.dart';

class NbaDioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await addAuthorizationHeader(options, Urls.apiKey, Urls.apiHost);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('ERROR:${err.message}');
    super.onError(err, handler);
  }

  Future<void> addAuthorizationHeader(
      RequestOptions options, String key, String host) async {
    options.headers["X-RapidAPI-Key"] = key;
    options.headers["X-RapidAPI-Host"] = host;
  }
}
