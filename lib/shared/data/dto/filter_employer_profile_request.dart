import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_employer_profile_request.freezed.dart';
part 'filter_employer_profile_request.g.dart';

@freezed
class FilterEmployerProfileRequest with _$FilterEmployerProfileRequest {
  const factory FilterEmployerProfileRequest({
    String? name,
    @JsonKey(name: 'provinceCode') String? provinceCode,
  }) = _FilterEmployerProfileRequest;

  factory FilterEmployerProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterEmployerProfileRequestFromJson(json);
}
