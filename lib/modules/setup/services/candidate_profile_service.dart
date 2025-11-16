import 'dart:io';

import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/shared/utils/format_helper.dart';

class ProfileSetupService {
  final _repository = getIt<CandidateProfileRepository>();

  Education _mapStringToEducation(String value) {
    switch (value) {
      case 'HIGH_SCHOOL':
        return Education.highSchool;
      case 'INTERMEDIATE':
        return Education.intermediate;
      case 'GRADUATION':
        return Education.graduation;
      case 'BACHELOR_DEGREE':
        return Education.bachelorDegree;
      case 'MASTER_DEGREE':
        return Education.masterDegree;
      default:
        return Education.highSchool;
    }
  }

  Future<BaseResponse<CandidateProfileDto>> createProfile({
    required String firstName,
    required String lastName,
    required String provinceCode,
    required String districtCode,
    String? bio,
    String? dateOfBirth,
    String? education,
    required bool gender,
    String? phoneNumber,
    File? avatarFile,
    List<Map<String, String>> socialLinks = const [],
  }) async {
    final profileRequest = CreateCandidateProfileRequest(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      bio: bio?.trim(),
      dateOfBirth: dateOfBirth != null
          ? FormatHelper.convertDateFormat(dateOfBirth)
          : null,
      education: education != null ? _mapStringToEducation(education) : null,
      gender: gender,
      phoneNumber: phoneNumber != null
          ? FormatHelper.formatPhoneNumber(phoneNumber.trim())
          : null,
    );

    final createResponse = await _repository.createProfile(profileRequest);

    if (createResponse.data == null) {
      throw Exception('Failed to create profile');
    }

    final profileId = createResponse.data!.id;

    if (avatarFile != null) {
      try {
        await _repository.updateAvatar(avatarFile);
      } catch (e) {}
    }

    if (socialLinks.isNotEmpty) {
      try {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: socialLinks
              .map(
                (link) => SocialLinkInput(
                  type: SocialLinkType.values.firstWhere(
                    (e) =>
                        e.name.toUpperCase() == link['platform']!.toUpperCase(),
                  ),
                  url: link['url']!,
                ),
              )
              .toList(),
        );

        await _repository.updateSocialLinks(socialLinksRequest);
      } catch (e) {}
    }

    final profileResponse = await _repository.getProfile(profileId);

    if (profileResponse.data == null) {
      throw Exception('Failed to fetch complete profile');
    }

    await AuthHelper.saveCandidateProfile(profileResponse.data!);

    return profileResponse;
  }

  Future<BaseResponse<CandidateProfileDto>> updateProfile({
    required String firstName,
    required String lastName,
    required String provinceCode,
    required String districtCode,
    String? bio,
    String? dateOfBirth,
    String? education,
    required bool gender,
    String? phoneNumber,
    File? avatarFile,
    List<Map<String, String>> socialLinks = const [],
  }) async {
    final profileRequest = CreateCandidateProfileRequest(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      bio: bio?.trim(),
      dateOfBirth: dateOfBirth != null
          ? FormatHelper.convertDateFormat(dateOfBirth)
          : null,
      education: education != null ? _mapStringToEducation(education) : null,
      gender: gender,
      phoneNumber: phoneNumber != null
          ? FormatHelper.formatPhoneNumber(phoneNumber.trim())
          : null,
    );

    await _repository.updateProfile(profileRequest);

    if (avatarFile != null) {
      try {
        await _repository.updateAvatar(avatarFile);
      } catch (e) {}
    }

    if (socialLinks.isNotEmpty) {
      try {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: socialLinks
              .map(
                (link) => SocialLinkInput(
                  type: SocialLinkType.values.firstWhere(
                    (e) =>
                        e.name.toUpperCase() == link['platform']!.toUpperCase(),
                  ),
                  url: link['url']!,
                ),
              )
              .toList(),
        );

        await _repository.updateSocialLinks(socialLinksRequest);
      } catch (e) {}
    }

    // Get complete updated profile from server
    final currentProfile = AuthHelper.candidateProfile;
    if (currentProfile == null) {
      throw Exception('No candidate profile found');
    }

    final profileResponse = await _repository.getProfile(currentProfile.id);

    if (profileResponse.data == null) {
      throw Exception('Failed to fetch updated profile');
    }

    // Save updated profile to AuthHelper for app-wide access
    await AuthHelper.saveCandidateProfile(profileResponse.data!);

    return profileResponse;
  }
}
