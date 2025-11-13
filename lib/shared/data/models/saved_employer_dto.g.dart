// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_employer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedEmployerDtoImpl _$$SavedEmployerDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SavedEmployerDtoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  location: json['location'] as String,
  logoUrl: json['logo_url'] as String?,
  jobCount: (json['job_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SavedEmployerDtoImplToJson(
  _$SavedEmployerDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
  'logo_url': instance.logoUrl,
  'job_count': instance.jobCount,
};
