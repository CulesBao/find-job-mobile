import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'application_dto.freezed.dart';
part 'application_dto.g.dart';

@freezed
class ApplicationDto with _$ApplicationDto {
  const factory ApplicationDto({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'candidate_profile')
    required CandidateProfileDto candidateProfile,
  }) = _ApplicationDto;

  factory ApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDtoFromJson(json);
}
