// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLinkDtoImpl _$$SocialLinkDtoImplFromJson(Map<String, dynamic> json) =>
    _$SocialLinkDtoImpl(
      id: json['id'] as String,
      type: $enumDecode(_$SocialLinkTypeEnumMap, json['type']),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$SocialLinkDtoImplToJson(_$SocialLinkDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SocialLinkTypeEnumMap[instance.type]!,
      'url': instance.url,
    };

const _$SocialLinkTypeEnumMap = {
  SocialLinkType.facebook: 'FACEBOOK',
  SocialLinkType.email: 'EMAIL',
  SocialLinkType.linkedin: 'LINKEDIN',
  SocialLinkType.github: 'GITHUB',
  SocialLinkType.instagram: 'INSTAGRAM',
  SocialLinkType.x: 'X',
  SocialLinkType.youtube: 'YOUTUBE',
  SocialLinkType.tiktok: 'TIKTOK',
  SocialLinkType.leetcode: 'LEETCODE',
  SocialLinkType.gitlab: 'GITLAB',
};
