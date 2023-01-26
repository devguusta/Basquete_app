import 'package:basquete_app/core/const/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NbaDioInterceptor extends InterceptorsWrapper {
  addAuthorizationHeader(RequestOptions options, String key, String host) {
    options.headers["X-RapidAPI-Key"] = key;
    options.headers["X-RapidAPI-Host"] = host;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('[DIO:ERROR]: ${err.message}');
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    addAuthorizationHeader(options, Urls.apiKey, Urls.apiHost);
    super.onRequest(options, handler);
  }
}
