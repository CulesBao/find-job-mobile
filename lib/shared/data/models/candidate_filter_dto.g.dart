// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateFilterDtoImpl _$$CandidateFilterDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CandidateFilterDtoImpl(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatarUrl: json['avatar_url'] as String?,
  education: $enumDecodeNullable(_$EducationEnumMap, json['education']),
  gender: json['gender'] as bool?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$$CandidateFilterDtoImplToJson(
  _$CandidateFilterDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar_url': instance.avatarUrl,
  'education': _$EducationEnumMap[instance.education],
  'gender': instance.gender,
  'location': instance.location,
};

const _$EducationEnumMap = {
  Education.highSchool: 'HIGH_SCHOOL',
  Education.intermediate: 'INTERMEDIATE',
  Education.graduation: 'GRADUATION',
  Education.masterDegree: 'MASTER_DEGREE',
  Education.bachelorDegree: 'BACHELOR_DEGREE',
};
