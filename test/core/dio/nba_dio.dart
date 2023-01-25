import 'package:dio/native_imp.dart';

import '../const/urls.dart';
import 'nba_dio_interceptor.dart';

class NbaDio extends DioForNative {
  NbaDio() {
    interceptors.addAll([
      NbaDioInterceptor(),
    ]);
    options.contentTypeWithRequestBody("application/json");
    options.baseUrl = Urls.nbaApi;
  }
}
