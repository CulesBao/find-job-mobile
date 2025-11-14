import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'filter_candidate_profile_request.freezed.dart';
part 'filter_candidate_profile_request.g.dart';

enum GenderFilter {
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
}

@freezed
class FilterCandidateProfileRequest with _$FilterCandidateProfileRequest {
  const factory FilterCandidateProfileRequest({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    Education? education,
    @JsonKey(name: 'province_code') String? provinceCode,
    GenderFilter? gender, // API expects 'MALE' or 'FEMALE' enum string
  }) = _FilterCandidateProfileRequest;

  factory FilterCandidateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterCandidateProfileRequestFromJson(json);
}
