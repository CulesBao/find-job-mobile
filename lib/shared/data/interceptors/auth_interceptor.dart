import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:find_job_mobile/shared/constants/api_constants.dart';

class AuthInterceptor extends Interceptor {
  final SharedPreferences prefs;

  AuthInterceptor(this.prefs);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add token to headers (matching web localStorage key)
    final token = prefs.getString(ApiConstants.accessTokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await prefs.remove(ApiConstants.accessTokenKey);
      await prefs.remove(ApiConstants.userKey);
    }

    return handler.next(err);
  }
}
