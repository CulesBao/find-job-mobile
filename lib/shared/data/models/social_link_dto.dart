import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_link_dto.freezed.dart';
part 'social_link_dto.g.dart';

enum SocialLinkType {
  @JsonValue('FACEBOOK')
  facebook,
  @JsonValue('EMAIL')
  email,
  @JsonValue('LINKEDIN')
  linkedin,
  @JsonValue('GITHUB')
  github,
  @JsonValue('INSTAGRAM')
  instagram,
  @JsonValue('X')
  x,
  @JsonValue('YOUTUBE')
  youtube,
  @JsonValue('TIKTOK')
  tiktok,
  @JsonValue('LEETCODE')
  leetcode,
  @JsonValue('GITLAB')
  gitlab,
}

@freezed
class SocialLinkDto with _$SocialLinkDto {
  const factory SocialLinkDto({
    required String id,
    required SocialLinkType type,
    required String url,
  }) = _SocialLinkDto;

  factory SocialLinkDto.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkDtoFromJson(json);
}
