import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'create_candidate_profile_request.freezed.dart';
part 'create_candidate_profile_request.g.dart';

@freezed
class CreateCandidateProfileRequest with _$CreateCandidateProfileRequest {
  const factory CreateCandidateProfileRequest({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'province_code') required String provinceCode,
    @JsonKey(name: 'district_code') required String districtCode,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    bool? gender,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  }) = _CreateCandidateProfileRequest;

  factory CreateCandidateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCandidateProfileRequestFromJson(json);
}
