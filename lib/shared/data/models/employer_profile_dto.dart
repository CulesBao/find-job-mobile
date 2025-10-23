import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:find_job_mobile/shared/data/models/province_dto.dart';
import 'package:find_job_mobile/shared/data/models/district_dto.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';

part 'employer_profile_dto.freezed.dart';
part 'employer_profile_dto.g.dart';

@freezed
class EmployerProfileDto with _$EmployerProfileDto {
  const factory EmployerProfileDto({
    required String id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? about,
    @JsonKey(name: 'established_in') String? establishedIn,
    @JsonKey(name: 'logo_url') String? logoUrl,
    required String name,
    String? vision,
    @JsonKey(name: 'website_url') String? websiteUrl,
    required ProvinceDto province,
    required DistrictDto district,
    @JsonKey(name: 'social_links') required List<SocialLinkDto> socialLinks,
  }) = _EmployerProfileDto;

  factory EmployerProfileDto.fromJson(Map<String, dynamic> json) =>
      _$EmployerProfileDtoFromJson(json);
}
