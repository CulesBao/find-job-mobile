// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountDtoImpl _$$AccountDtoImplFromJson(Map<String, dynamic> json) =>
    _$AccountDtoImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      email: json['email'] as String,
      isActive: json['is_active'] as bool,
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      role: $enumDecode(_$RoleEnumMap, json['role']),
      candidateProfileDto: json['candidate_profile_dto'] == null
          ? null
          : CandidateProfileDto.fromJson(
              json['candidate_profile_dto'] as Map<String, dynamic>,
            ),
      employerProfileDto: json['employer_profile_dto'] == null
          ? null
          : EmployerProfileDto.fromJson(
              json['employer_profile_dto'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$AccountDtoImplToJson(_$AccountDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'is_active': instance.isActive,
      'provider': _$ProviderEnumMap[instance.provider]!,
      'role': _$RoleEnumMap[instance.role]!,
      'candidate_profile_dto': instance.candidateProfileDto,
      'employer_profile_dto': instance.employerProfileDto,
    };

const _$ProviderEnumMap = {Provider.google: 'GOOGLE', Provider.local: 'LOCAL'};

const _$RoleEnumMap = {
  Role.admin: 'ADMIN',
  Role.candidate: 'CANDIDATE',
  Role.employer: 'EMPLOYER',
};
