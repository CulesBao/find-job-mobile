import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = 'An error occurred';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _extractErrorMessage(err.response);
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection';
        break;
      default:
        errorMessage = 'Something went wrong';
    }

    return handler.next(err.copyWith(error: errorMessage));
  }

  String _extractErrorMessage(Response? response) {
    if (response?.data != null) {
      try {
        if (response!.data is Map<String, dynamic>) {
          final message = response.data['message'];
          if (message != null && message.toString().isNotEmpty) {
            return message.toString();
          }
        }
      } catch (_) {}
    }
    return 'Something went wrong';
  }
}
