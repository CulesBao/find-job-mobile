import 'dart:io';

import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';
import 'package:find_job_mobile/shared/utils/format_helper.dart';

class EmployerProfileService {
  final _repository = getIt<EmployerProfileRepository>();

  /// Create complete employer profile with sequential API calls
  ///
  /// Flow:
  /// 1. POST /employer-profile/ → Get profile ID
  /// 2. PUT /employer-profile/update-logo (if logo provided)
  /// 3. PUT /employer-profile/social-links (if social links provided)
  /// 4. GET /employer-profile/{id} → Get complete profile
  /// 5. Save to AuthHelper
  Future<BaseResponse<EmployerProfileDto>> createProfile({
    required String name,
    required String establishedIn,
    required String websiteUrl,
    required String provinceCode,
    required String districtCode,
    required String location,
    String? about,
    String? vision,
    File? logoFile,
    List<SocialLinkInput>? socialLinks,
  }) async {
    // Step 1: Create basic profile - MUST succeed to get ID
    final request = CreateEmployerProfileRequest(
      name: name.trim(),
      establishedIn: FormatHelper.convertDateFormat(establishedIn.trim()),
      websiteUrl: websiteUrl.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      location: location.trim(),
      about: about?.trim(),
      vision: vision?.trim(),
    );

    final createResponse = await _repository.createProfile(request);

    if (createResponse.data == null) {
      throw Exception('Failed to create profile');
    }

    final profileId = createResponse.data!.id;

    // Step 2: Update logo if provided
    if (logoFile != null) {
      try {
        await _repository.updateLogo(logoFile);
      } catch (e) {
        // Continue even if logo upload fails
        print('Failed to upload logo: $e');
      }
    }

    // Step 3: Update social links if provided
    if (socialLinks != null && socialLinks.isNotEmpty) {
      try {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: socialLinks,
        );
        await _repository.updateSocialLinks(socialLinksRequest);
      } catch (e) {
        // Continue even if social links update fails
        print('Failed to update social links: $e');
      }
    }

    // Step 4: Get complete profile with all updates
    final profileResponse = await _repository.getProfile(profileId);

    if (profileResponse.data == null) {
      throw Exception('Failed to fetch complete profile');
    }

    // Step 5: Save to AuthHelper for app-wide access
    await AuthHelper.saveEmployerProfile(profileResponse.data!);

    return profileResponse;
  }

  /// Update existing employer profile
  Future<BaseResponse<dynamic>> updateProfile({
    required String name,
    required String establishedIn,
    required String websiteUrl,
    required String provinceCode,
    required String districtCode,
    required String location,
    String? about,
    String? vision,
    File? logoFile,
    List<SocialLinkInput>? socialLinks,
  }) async {
    // Step 1: Update basic profile
    final request = CreateEmployerProfileRequest(
      name: name.trim(),
      establishedIn: FormatHelper.convertDateFormat(establishedIn.trim()),
      websiteUrl: websiteUrl.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      location: location.trim(),
      about: about?.trim(),
      vision: vision?.trim(),
    );

    final updateResponse = await _repository.updateProfile(request);

    // Step 2: Update logo if provided
    if (logoFile != null) {
      try {
        await _repository.updateLogo(logoFile);
      } catch (e) {
        print('Failed to upload logo: $e');
      }
    }

    // Step 3: Update social links if provided
    if (socialLinks != null && socialLinks.isNotEmpty) {
      try {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: socialLinks,
        );
        await _repository.updateSocialLinks(socialLinksRequest);
      } catch (e) {
        print('Failed to update social links: $e');
      }
    }

    return updateResponse;
  }
}
