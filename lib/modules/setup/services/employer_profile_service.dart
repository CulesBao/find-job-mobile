import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
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
    required String companyName,
    required String establishedDate,
    required String websiteUrl,
    required String provinceCode,
    required String districtCode,
    String? about,
    String? vision,
  }) async {
    final request = CreateEmployerProfileRequest(
      companyName: companyName.trim(),
      establishedDate: convertDateFormat(establishedDate.trim()),
      websiteUrl: websiteUrl.trim(),
      provinceCode: provinceCode,
      districtCode: districtCode,
      about: about?.trim(),
      vision: vision?.trim(),
    );

    final response = await _repository.createProfile(request);

    if (response.data != null) {
      await AuthHelper.saveEmployerProfile(response.data!);
    }

    return response;
  }
}
