import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart' show Education;

part 'candidate_filter_dto.freezed.dart';
part 'candidate_filter_dto.g.dart';

/// Simplified DTO for candidate filter results (different from full CandidateProfileDto)
/// API filter endpoint returns simplified data similar to SavedCandidateDto
@freezed
class CandidateFilterDto with _$CandidateFilterDto {
  const factory CandidateFilterDto({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    Education? education,
    bool? gender, // true = male, false = female, null = not specified
    String? location, // String like "District, Province" or just "Province"
  }) = _CandidateFilterDto;

  factory CandidateFilterDto.fromJson(Map<String, dynamic> json) =>
      _$CandidateFilterDtoFromJson(json);
}
