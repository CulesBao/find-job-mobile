import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:find_job_mobile/shared/constants/api_constants.dart';
import 'package:find_job_mobile/shared/constants/app_constants.dart';
import 'package:find_job_mobile/shared/data/interceptors/auth_interceptor.dart';
import 'package:find_job_mobile/shared/data/interceptors/error_interceptor.dart';

class DioClient {
  late final Dio _dio;
  final SharedPreferences? prefs;

  DioClient({this.prefs}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': ApiConstants.contentType,
          'Accept': ApiConstants.accept,
        },
      ),
    );

    if (prefs != null) {
      _dio.interceptors.add(AuthInterceptor(prefs!));
    }

    _dio.interceptors.add(ErrorInterceptor());

    // Add logger only in development mode
    if (AppConstants.isDevelopment) {
      _dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Dio get dio => _dio;
}
