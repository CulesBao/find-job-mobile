// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationDtoImpl _$$ApplicationDtoImplFromJson(Map<String, dynamic> json) =>
    _$ApplicationDtoImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      coverLetter: json['cover_letter'] as String?,
      cvUrl: json['cv_url'] as String?,
      candidateProfile: CandidateProfileDto.fromJson(
        json['candidate_profile'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$ApplicationDtoImplToJson(
  _$ApplicationDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'cover_letter': instance.coverLetter,
  'cv_url': instance.cvUrl,
  'candidate_profile': instance.candidateProfile,
};
