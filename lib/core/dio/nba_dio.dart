import 'package:basquete_app/core/const/urls.dart';
import 'package:basquete_app/core/dio/nba_dio_interceptor.dart';
import 'package:dio/native_imp.dart';

class NbaDio extends DioForNative {
  NbaDio() {
    interceptors.addAll([
      NbaDioInterceptor(),
    ]);
    options.contentTypeWithRequestBody("application/json");
    options.baseUrl = Urls.nbaApi;
  }
}
