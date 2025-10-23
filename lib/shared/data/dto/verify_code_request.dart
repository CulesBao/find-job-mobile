import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_request.freezed.dart';
part 'verify_code_request.g.dart';

@freezed
class VerifyCodeRequest with _$VerifyCodeRequest {
  const factory VerifyCodeRequest({required String code}) = _VerifyCodeRequest;

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);
}
