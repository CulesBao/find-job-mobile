import 'dart:io';

import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

abstract class EmployerProfileRepository {
  Future<BaseResponse<EmployerProfileDto>> createProfile(
    CreateEmployerProfileRequest request,
  );

  Future<BaseResponse<EmployerProfileDto>> getProfile(String id);

  Future<BaseResponse<dynamic>> updateProfile(
    CreateEmployerProfileRequest request,
  );

  Future<BaseResponse<dynamic>> updateSocialLinks(
    UpdateSocialLinksRequest request,
  );

  Future<BaseResponse<dynamic>> updateLogo(File logo);

  Future<BaseResponse<PageableResponse<EmployerProfileDto>>> filterEmployerProfiles({
    String? name,
    String? provinceCode,
    int page = 0,
    int size = 10,
  });
}
