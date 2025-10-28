class CreateEmployerProfileRequest {
  final String name;
  final String establishedIn;
  final String websiteUrl;
  final String provinceCode;
  final String districtCode;
  final String location;
  final String? about;
  final String? vision;

  CreateEmployerProfileRequest({
    required this.name,
    required this.establishedIn,
    required this.websiteUrl,
    required this.provinceCode,
    required this.districtCode,
    required this.location,
    this.about,
    this.vision,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'established_in': establishedIn,
      'website_url': websiteUrl,
      'province_code': provinceCode,
      'district_code': districtCode,
      'location': location,
      if (about != null) 'about': about,
      if (vision != null) 'vision': vision,
    };
  }
}
