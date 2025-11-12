import 'package:find_job_mobile/shared/data/api/candidate_follower_api_service.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

class CandidateFollowerRepository {
  final CandidateFollowerApiService _apiService;

  CandidateFollowerRepository(this._apiService);

  /// Follow an employer
  Future<BaseResponse<void>> followEmployer(String employerId) async {
    try {
      return await _apiService.followEmployer(employerId);
    } catch (e) {
      rethrow;
    }
  }

  /// Unfollow an employer
  Future<BaseResponse<void>> unfollowEmployer(String employerId) async {
    try {
      return await _apiService.unfollowEmployer(employerId);
    } catch (e) {
      rethrow;
    }
  }

  /// Check if following an employer
  Future<BaseResponse<bool>> isFollowed(String employerId) async {
    try {
      return await _apiService.isFollowed(employerId);
    } catch (e) {
      rethrow;
    }
  }

  /// Get list of followed employers with pagination
  Future<BaseResponse<PageableResponse<EmployerProfileDto>>>
      getFollowedEmployers({
    int page = 0,
    int size = 10,
  }) async {
    try {
      return await _apiService.getFollowedEmployers(page, size);
    } catch (e) {
      rethrow;
    }
  }
}
