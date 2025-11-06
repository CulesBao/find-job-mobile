import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MessageHelper {
  static void showError(
    BuildContext context,
    dynamic error, {
    String? fallbackMessage,
  }) {
    String errorMessage = fallbackMessage ?? 'An error occurred';

    if (error is DioException && error.error != null) {
      errorMessage = error.error.toString();
    } else if (error != null) {
      errorMessage = error.toString();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}
