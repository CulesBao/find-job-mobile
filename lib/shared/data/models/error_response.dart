import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

/// Error response format from backend: { "message": "...", "error_code": "..." }
@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    required String message,
    @JsonKey(name: 'error_code') String? errorCode,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
