import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'filter_job_request.freezed.dart';
part 'filter_job_request.g.dart';

@freezed
class FilterJobRequest with _$FilterJobRequest {
  const factory FilterJobRequest({
    String? title,
    @JsonKey(name: 'province_code') String? provinceCode,
    @JsonKey(name: 'job_type') JobType? jobType,
    @JsonKey(name: 'min_salary') double? minSalary,
    @JsonKey(name: 'max_salary') double? maxSalary,
    Currency? currency,
    @JsonKey(name: 'salary_type') SalaryType? salaryType,
    Education? education,
  }) = _FilterJobRequest;

  factory FilterJobRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterJobRequestFromJson(json);
}
