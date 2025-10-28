import 'dart:io';

import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';

class EmployerProfileService {
  final _repository = getIt<EmployerProfileRepository>();

  String convertDateFormat(String dateStr) {
    // Convert "DD MMM YYYY" to "YYYY-MM-DD"
    try {
      final parts = dateStr.split(' ');
      if (parts.length != 3) return dateStr;

      final day = parts[0].padLeft(2, '0');
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final monthIndex = months.indexOf(parts[1]) + 1;
      if (monthIndex == 0) return dateStr; // Invalid month
      final month = monthIndex.toString().padLeft(2, '0');
      final year = parts[2];

      // Validate date components
      final dayInt = int.tryParse(day);
      final yearInt = int.tryParse(year);
      if (dayInt == null ||
          yearInt == null ||
          dayInt < 1 ||
          dayInt > 31 ||
          yearInt < 1900) {
        return dateStr;
      }

      // Create DateTime object to validate date
      final date = DateTime.tryParse('$year-$month-$day');
      if (date == null) return dateStr;

      return '$year-$month-$day';
    } catch (e) {
      return dateStr;
    }
  }

  Future<BaseResponse<EmployerProfileDto>> createProfile({
    required String name,
    required String establishedIn,
    required String websiteUrl,
    required String provinceCode,
    required String districtCode,
    required String location,
    String? about,
    String? vision,
    File? logo,
    List<SocialLinkInput>? socialLinks,
  }) async {
    try {
      // Step 1: Create profile
      final request = CreateEmployerProfileRequest(
        name: name.trim(),
        establishedIn: convertDateFormat(establishedIn.trim()),
        websiteUrl: websiteUrl.trim(),
        provinceCode: provinceCode,
        districtCode: districtCode,
        location: location.trim(),
        about: about?.trim(),
        vision: vision?.trim(),
      );

      final createResponse = await _repository.createProfile(request);

      if (createResponse.data == null) {
        throw Exception('Failed to create profile: ${createResponse.message}');
      }

      final profileId = createResponse.data!.id;

      // Step 2: Update logo if provided
      if (logo != null) {
        await _repository.updateLogo(logo);
      }

      // Step 3: Update social links if provided
      if (socialLinks != null && socialLinks.isNotEmpty) {
        final socialLinksRequest = UpdateSocialLinksRequest(
          socialLinks: socialLinks,
        );
        await _repository.updateSocialLinks(socialLinksRequest);
      }

      // Step 4: Get complete profile with all data
      final completeProfile = await _repository.getProfile(profileId);

      if (completeProfile.data != null) {
        // Step 5: Save to AuthHelper
        await AuthHelper.saveEmployerProfile(completeProfile.data!);
      }

      return completeProfile;
    } catch (e) {
      rethrow;
    }
  }
}
