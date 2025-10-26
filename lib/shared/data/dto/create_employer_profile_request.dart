import 'package:find_job_mobile/shared/data/models/base_response.dart';

class CreateEmployerProfileRequest {
  final String companyName;
  final String establishedDate;
  final String websiteUrl;
  final String provinceCode;
  final String districtCode;
  final String? about;
  final String? vision;

  CreateEmployerProfileRequest({
    required this.companyName,
    required this.establishedDate,
    required this.websiteUrl,
    required this.provinceCode,
    required this.districtCode,
    this.about,
    this.vision,
  });

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'establishedDate': establishedDate,
      'websiteUrl': websiteUrl,
      'provinceCode': provinceCode,
      'districtCode': districtCode,
      'about': about,
      'vision': vision,
    };
  }
}
