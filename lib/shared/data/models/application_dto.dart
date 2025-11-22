import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'application_dto.freezed.dart';
part 'application_dto.g.dart';

enum JobProcess {
  @JsonValue('APPLICATION_SUBMITTED')
  applicationSubmitted,
  @JsonValue('APPLICATION_REVIEW')
  applicationReview,
  @JsonValue('SCREENING')
  screening,
  @JsonValue('PHONE_INTERVIEW')
  phoneInterview,
  @JsonValue('TECHNICAL_TEST')
  technicalTest,
  @JsonValue('FIRST_INTERVIEW')
  firstInterview,
  @JsonValue('SECOND_INTERVIEW')
  secondInterview,
  @JsonValue('FINAL_INTERVIEW')
  finalInterview,
  @JsonValue('OFFER_NEGOTIATION')
  offerNegotiation,
  @JsonValue('OFFER_SENT')
  offerSent,
  @JsonValue('OFFER_ACCEPTED')
  offerAccepted,
  @JsonValue('HIRED')
  hired,
  @JsonValue('ONBOARDING')
  onboarding,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('WITHDRAWN')
  withdrawn,
}

// DTO for candidate's applied jobs list
@freezed
class AppliedJobDto with _$AppliedJobDto {
  const factory AppliedJobDto({
    @JsonKey(name: 'application_id') required String applicationId,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'currency') String? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'job_proccess') String? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
  }) = _AppliedJobDto;

  factory AppliedJobDto.fromJson(Map<String, dynamic> json) =>
      _$AppliedJobDtoFromJson(json);
}

@freezed
class ApplicationDto with _$ApplicationDto {
  const factory ApplicationDto({
    required String id,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'cover_letter') String? coverLetter,
    @JsonKey(name: 'cv_url') String? cvUrl,
    @JsonKey(name: 'job_process') JobProcess? jobProcess,
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'job_title') String? jobTitle,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_logo') String? companyLogo,
    @JsonKey(name: 'candidate_profile')
    CandidateProfileDto? candidateProfile,
  }) = _ApplicationDto;

  factory ApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDtoFromJson(json);
}

@freezed
class ApplicationStatusDto with _$ApplicationStatusDto {
  const factory ApplicationStatusDto({
    @JsonKey(name: 'job_id') required String jobId,
    @JsonKey(name: 'has_applied') required bool hasApplied,
    @JsonKey(name: 'application_id') String? applicationId,
    @JsonKey(name: 'job_process') JobProcess? jobProcess,
    @JsonKey(name: 'applied_at') DateTime? appliedAt,
  }) = _ApplicationStatusDto;

  factory ApplicationStatusDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusDtoFromJson(json);
}
