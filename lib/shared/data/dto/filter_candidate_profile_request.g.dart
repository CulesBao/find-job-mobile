// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_candidate_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterCandidateProfileRequestImpl
_$$FilterCandidateProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$FilterCandidateProfileRequestImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
      provinceCode: json['provinceCode'] as String?,
      gender: $enumDecodeNullable(_$GenderFilterEnumMap, json['gender']),
    );

Map<String, dynamic> _$$FilterCandidateProfileRequestImplToJson(
  _$FilterCandidateProfileRequestImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'education': _$EducationEnumMap[instance.education],
  'provinceCode': instance.provinceCode,
  'gender': _$GenderFilterEnumMap[instance.gender],
};

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_DEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
};

const _$GenderFilterEnumMap = {GenderFilter.male: 0, GenderFilter.female: 1};
