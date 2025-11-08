import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'create_job_request.freezed.dart';
part 'create_job_request.g.dart';

@freezed
class CreateJobRequest with _$CreateJobRequest {
  const factory CreateJobRequest({
    required String title,
    String? description,
    String? responsibility,
    Education? education,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Currency? currency,
    @JsonKey(name: 'expired_at') String? expiredAt,
  }) = _CreateJobRequest;

  factory CreateJobRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateJobRequestFromJson(json);
}