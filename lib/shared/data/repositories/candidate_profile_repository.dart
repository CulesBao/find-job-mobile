import 'dart:io';
import 'package:find_job_mobile/shared/data/api/candidate_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';

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
}
