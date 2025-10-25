import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';

part 'update_social_links_request.freezed.dart';
part 'update_social_links_request.g.dart';

@freezed
class UpdateSocialLinksRequest with _$UpdateSocialLinksRequest {
  const factory UpdateSocialLinksRequest({
    @JsonKey(name: 'social_links') required List<SocialLinkInput> socialLinks,
  }) = _UpdateSocialLinksRequest;

  factory UpdateSocialLinksRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSocialLinksRequestFromJson(json);
}

@freezed
class SocialLinkInput with _$SocialLinkInput {
  const factory SocialLinkInput({
    required SocialLinkType type,
    required String url,
  }) = _SocialLinkInput;

  factory SocialLinkInput.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkInputFromJson(json);
}
