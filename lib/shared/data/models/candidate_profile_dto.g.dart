// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateProfileDtoImpl _$$CandidateProfileDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CandidateProfileDtoImpl(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  avatarUrl: json['avatar_url'] as String?,
  bio: json['bio'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
  firstName: json['first_name'] as String,
  gender: json['gender'] as bool?,
  lastName: json['last_name'] as String,
  phoneNumber: json['phone_number'] as String?,
  province: ProvinceDto.fromJson(json['province'] as Map<String, dynamic>),
  district: DistrictDto.fromJson(json['district'] as Map<String, dynamic>),
  socialLinks: (json['social_links'] as List<dynamic>)
      .map((e) => SocialLinkDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CandidateProfileDtoImplToJson(
  _$CandidateProfileDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'avatar_url': instance.avatarUrl,
  'bio': instance.bio,
  'date_of_birth': instance.dateOfBirth,
  'education': _$EducationEnumMap[instance.education],
  'first_name': instance.firstName,
  'gender': instance.gender,
  'last_name': instance.lastName,
  'phone_number': instance.phoneNumber,
  'province': instance.province,
  'district': instance.district,
  'social_links': instance.socialLinks,
};

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_GEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
};
