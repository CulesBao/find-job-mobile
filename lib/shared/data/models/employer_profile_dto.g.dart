// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employer_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployerProfileDtoImpl _$$EmployerProfileDtoImplFromJson(
  Map<String, dynamic> json,
) => _$EmployerProfileDtoImpl(
  id: json['id'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  about: json['about'] as String?,
  establishedIn: json['established_in'] as String?,
  logoUrl: json['logo_url'] as String?,
  name: json['name'] as String,
  vision: json['vision'] as String?,
  websiteUrl: json['website_url'] as String?,
  province: json['province'] == null
      ? null
      : ProvinceDto.fromJson(json['province'] as Map<String, dynamic>),
  district: json['district'] == null
      ? null
      : DistrictDto.fromJson(json['district'] as Map<String, dynamic>),
  socialLinks: (json['social_links'] as List<dynamic>?)
      ?.map((e) => SocialLinkDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$EmployerProfileDtoImplToJson(
  _$EmployerProfileDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'about': instance.about,
  'established_in': instance.establishedIn,
  'logo_url': instance.logoUrl,
  'name': instance.name,
  'vision': instance.vision,
  'website_url': instance.websiteUrl,
  'province': instance.province,
  'district': instance.district,
  'social_links': instance.socialLinks,
};
