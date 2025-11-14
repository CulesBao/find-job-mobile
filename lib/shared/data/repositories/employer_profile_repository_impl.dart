import 'dart:io';

import 'package:find_job_mobile/shared/data/api/employer_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';

class EmployerProfileRepositoryImpl implements EmployerProfileRepository {
  final EmployerProfileApiService _apiService;

  EmployerProfileRepositoryImpl(this._apiService);

  @override
  Future<BaseResponse<EmployerProfileDto>> createProfile(
    CreateEmployerProfileRequest request,
  ) async {
    try {
      return await _apiService.createProfile(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EmployerProfileDto>> getProfile(String id) async {
    try {
      return await _apiService.getProfile(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<dynamic>> updateProfile(
    CreateEmployerProfileRequest request,
  ) async {
    try {
      return await _apiService.updateProfile(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<dynamic>> updateSocialLinks(
    UpdateSocialLinksRequest request,
  ) async {
    try {
      return await _apiService.updateSocialLinks(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<dynamic>> updateLogo(File logo) async {
    try {
      return await _apiService.updateLogo(logo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PageableResponse<EmployerProfileDto>>> filterEmployerProfiles({
    String? name,
    String? provinceCode,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final filter = FilterEmployerProfileRequest(
        name: name,
        provinceCode: provinceCode,
      );
      return await _apiService.filterEmployerProfile(filter, page, size);
    } catch (e) {
      rethrow;
    }
  }
}
