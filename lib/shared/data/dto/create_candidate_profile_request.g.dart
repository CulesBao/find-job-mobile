// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_candidate_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCandidateProfileRequestImpl
_$$CreateCandidateProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$CreateCandidateProfileRequestImpl(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      provinceCode: json['province_code'] as String,
      districtCode: json['district_code'] as String,
      bio: json['bio'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
      gender: json['gender'] as bool?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$$CreateCandidateProfileRequestImplToJson(
  _$CreateCandidateProfileRequestImpl instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'province_code': instance.provinceCode,
  'district_code': instance.districtCode,
  'bio': instance.bio,
  'date_of_birth': instance.dateOfBirth,
  'education': _$EducationEnumMap[instance.education],
  'gender': instance.gender,
  'phone_number': instance.phoneNumber,
};

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_DEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
};
