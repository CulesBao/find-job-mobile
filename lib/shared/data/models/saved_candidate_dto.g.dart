// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_candidate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedCandidateDtoImpl _$$SavedCandidateDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SavedCandidateDtoImpl(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  location: json['location'] as String,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$$SavedCandidateDtoImplToJson(
  _$SavedCandidateDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'location': instance.location,
  'avatar_url': instance.avatarUrl,
};
