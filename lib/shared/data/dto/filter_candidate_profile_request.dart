import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

part 'filter_candidate_profile_request.freezed.dart';
part 'filter_candidate_profile_request.g.dart';

@JsonEnum(valueField: 'numericValue')
enum GenderFilter {
  male(0),
  female(1);

  const GenderFilter(this.numericValue);
  final int numericValue;
}

@freezed
class FilterCandidateProfileRequest with _$FilterCandidateProfileRequest {
  const FilterCandidateProfileRequest._();

  const factory FilterCandidateProfileRequest({
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    Education? education,
    @JsonKey(name: 'provinceCode') String? provinceCode,
    GenderFilter? gender,
  }) = _FilterCandidateProfileRequest;

  factory FilterCandidateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterCandidateProfileRequestFromJson(json);

  // Custom toJson that excludes null values
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (firstName != null) map['firstName'] = firstName;
    if (lastName != null) map['lastName'] = lastName;
    if (education != null) {
      // Use Education enum's built-in name mapping
      final educationMap = {
        Education.highSchool: 'HIGH_SCHOOL',
        Education.intermediate: 'INTERMEDIATE',
        Education.graduation: 'GRADUATION',
        Education.bachelorDegree: 'BACHELOR_DEGREE',
        Education.masterDegree: 'MASTER_DEGREE',
      };
      map['education'] = educationMap[education];
    }
    if (provinceCode != null) map['provinceCode'] = provinceCode;
    if (gender != null) {
      // API expects 0 for Male, 1 for Female
      map['gender'] = gender == GenderFilter.male ? 0 : 1;
    }
    return map;
  }
}
