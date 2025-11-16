import 'package:find_job_mobile/shared/data/api/employer_follower_api_service.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/saved_candidate_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

class EmployerFollowerRepository {
  final EmployerFollowerApiService _apiService;

  EmployerFollowerRepository(this._apiService);

  /// Follow a candidate
  Future<BaseResponse<void>> followCandidate(String candidateId) async {
    try {
      return await _apiService.followCandidate(candidateId);
    } catch (e) {
      rethrow;
    }
  }

  /// Unfollow a candidate
  Future<BaseResponse<void>> unfollowCandidate(String candidateId) async {
    try {
      return await _apiService.unfollowCandidate(candidateId);
    } catch (e) {
      rethrow;
    }
  }

  /// Check if following a candidate
  Future<BaseResponse<bool>> isFollowed(String candidateId) async {
    try {
      return await _apiService.isFollowed(candidateId);
    } catch (e) {
      rethrow;
    }
  }

  /// Get list of followed candidates with pagination
  Future<BaseResponse<PageableResponse<SavedCandidateDto>>>
      getFollowedCandidates({
    int page = 0,
    int size = 10,
  }) async {
    try {
      return await _apiService.getFollowedCandidates(page, size);
    } catch (e) {
      rethrow;
    }
  }
}
