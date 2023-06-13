import 'package:core/cache/preference_manager.dart';
import 'package:core/networking/networking.dart';
import 'package:dio/dio.dart';

import 'api_constant.dart';

class DioClient {
  final ApiConfigurations configurations;
  final PreferenceManager preferenceManager;

  DioClient({required this.configurations, required this.preferenceManager});

  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
        baseUrl: configurations.baseUrlProd,
        connectTimeout: 50000,
        receiveTimeout: 30000);
    final dio = Dio(options);
    options.headers = {'Content-Type': 'application/json'};
    dio.interceptors.addAll([AuthInterceptor(preferenceManager)]);
    return dio;
  }
}

class AuthInterceptor extends Interceptor {
  final PreferenceManager preferenceManager;

  AuthInterceptor(this.preferenceManager);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      "Authorization": preferenceManager.authToken(),
      "lang": preferenceManager.currentLang()
    };

    print("Auth Token >> ${options.headers}");
    return super.onRequest(options, handler);
  }
}
