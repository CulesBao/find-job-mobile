// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  provider: $enumDecode(_$ProviderEnumMap, json['provider']),
  role: $enumDecode(_$RoleEnumMap, json['role']),
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'provider': _$ProviderEnumMap[instance.provider]!,
  'role': _$RoleEnumMap[instance.role]!,
};

const _$ProviderEnumMap = {Provider.google: 'GOOGLE', Provider.local: 'LOCAL'};

const _$RoleEnumMap = {
  Role.admin: 'ADMIN',
  Role.candidate: 'CANDIDATE',
  Role.employer: 'EMPLOYER',
};
