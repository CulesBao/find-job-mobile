import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/data/models/district_dto.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';

part 'candidate_profile_dto.freezed.dart';
part 'candidate_profile_dto.g.dart';

enum Education {
  @JsonValue('HIGH_SCHOOL')
  highSchool,
  @JsonValue('INTERMEDIATE')
  intermediate,
  @JsonValue('GRADUATION')
  graduation,
  @JsonValue('MASTER_GEGREE')
  masterDegree,
  @JsonValue('BACHELOR_DEGREE')
  bachelorDegree,
}

@freezed
class CandidateProfileDto with _$CandidateProfileDto {
  const factory CandidateProfileDto({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? bio,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    Education? education,
    @JsonKey(name: 'first_name') required String firstName,
    bool? gender,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    required ProvinceDto province,
    required DistrictDto district,
    @JsonKey(name: 'social_links') required List<SocialLinkDto> socialLinks,
  }) = _CandidateProfileDto;

  factory CandidateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$CandidateProfileDtoFromJson(json);
}
