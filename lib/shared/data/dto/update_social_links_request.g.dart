// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_social_links_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateSocialLinksRequestImpl _$$UpdateSocialLinksRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateSocialLinksRequestImpl(
  socialLinks: (json['social_links'] as List<dynamic>)
      .map((e) => SocialLinkInput.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UpdateSocialLinksRequestImplToJson(
  _$UpdateSocialLinksRequestImpl instance,
) => <String, dynamic>{'social_links': instance.socialLinks};

_$SocialLinkInputImpl _$$SocialLinkInputImplFromJson(
  Map<String, dynamic> json,
) => _$SocialLinkInputImpl(
  type: $enumDecode(_$SocialLinkTypeEnumMap, json['type']),
  url: json['url'] as String,
);

Map<String, dynamic> _$$SocialLinkInputImplToJson(
  _$SocialLinkInputImpl instance,
) => <String, dynamic>{
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
