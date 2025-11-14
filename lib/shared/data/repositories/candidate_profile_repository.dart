import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:find_job_mobile/shared/data/api/candidate_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

class CandidateProfileRepository {
  final CandidateProfileApiService _apiService;

  CandidateProfileRepository(this._apiService);

  Future<BaseResponse<CandidateProfileDto>> createProfile(
    CreateCandidateProfileRequest request,
  ) async {
    try {
      final response = await _apiService.createProfile(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> updateProfile(
    CreateCandidateProfileRequest request,
  ) async {
    try {
      final response = await _apiService.updateProfile(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<CandidateProfileDto>> getProfile(
    String candidateProfileId,
  ) async {
    try {
      final response = await _apiService.getProfile(candidateProfileId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> updateSocialLinks(
    UpdateSocialLinksRequest request,
  ) async {
    try {
      final response = await _apiService.updateSocialLinks(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> updateAvatar(File avatar) async {
    try {
      final response = await _apiService.updateAvatar(avatar);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<PageableResponse<CandidateFilterDto>>> filterCandidateProfiles({
    String? firstName,
    String? lastName,
    Education? education,
    String? provinceCode,
    GenderFilter? gender,
    int page = 0,
    int size = 10,
  }) async {
    try {
      debugPrint('📤 API Request - Filter Candidates:');
      debugPrint('   firstName: $firstName');
      debugPrint('   lastName: $lastName');
      debugPrint('   education: $education');
      debugPrint('   provinceCode: $provinceCode');
      debugPrint('   gender (enum): $gender');
      debugPrint('   page: $page, size: $size');
      
      final filter = FilterCandidateProfileRequest(
        firstName: firstName,
        lastName: lastName,
        education: education,
        provinceCode: provinceCode,
        gender: gender,
      );
      
      debugPrint('   Filter object: ${filter.toJson()}');

      final response = await _apiService.filterCandidateProfile(filter, page, size);
      
      debugPrint('📥 API Response:');
      debugPrint('   Success: ${response.success}');
      debugPrint('   Data count: ${response.data?.content.length ?? 0}');
      
      // Log each candidate's raw data for debugging
      if (response.data?.content != null) {
        for (var i = 0; i < response.data!.content.length; i++) {
          final candidate = response.data!.content[i];
          debugPrint('   Candidate $i:');
          debugPrint('     - Name: ${candidate.firstName} ${candidate.lastName}');
          debugPrint('     - Gender (boolean): ${candidate.gender}');
          debugPrint('     - Gender type: ${candidate.gender.runtimeType}');
          debugPrint('     - Location: ${candidate.location}');
          debugPrint('     - Education: ${candidate.education}');
        }
      }
      
      return response;
    } catch (e) {
      debugPrint('❌ API Error: $e');
      rethrow;
    }
  }
}
