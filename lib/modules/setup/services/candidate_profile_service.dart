import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/social_link_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/candidate_profile_repository.dart';
import 'package:find_job_mobile/shared/utils/auth_helper.dart';

class ProfileSetupService {
  final _repository = getIt<CandidateProfileRepository>();

  String formatPhoneNumber(String phone) {
    if (phone.isEmpty) return phone;
    phone = phone.replaceAll(RegExp(r'[^\d]'), '');
    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }
    return '+84$phone';
  }

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

  Education mapStringToEducation(String value) {
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
    List<Map<String, String>> socialLinks = const [],
  }) async {
    // Step 1: Create profile
    final profileRequest = CreateCandidateProfileRequest(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      bio: bio?.trim(),
      dateOfBirth: dateOfBirth != null ? convertDateFormat(dateOfBirth) : null,
      education: education != null ? mapStringToEducation(education) : null,
      gender: gender,
      phoneNumber: phoneNumber != null
          ? formatPhoneNumber(phoneNumber.trim())
          : null,
    );

    final createResponse = await _repository.createProfile(profileRequest);

    // Step 2: Update social links if any
    if (socialLinks.isNotEmpty && createResponse.data != null) {
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
    }

    // Step 3: Get updated profile and save to AuthHelper
    if (createResponse.data != null) {
      final profileResponse = await _repository.getProfile(
        createResponse.data!.id,
      );

      if (profileResponse.data != null) {
        await AuthHelper.saveCandidateProfile(profileResponse.data!);
      }
    }

    return createResponse;
  }
}
