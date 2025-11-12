import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

part 'employer_follower_api_service.g.dart';

@RestApi()
abstract class EmployerFollowerApiService {
  factory EmployerFollowerApiService(Dio dio, {String? baseUrl}) =
      _EmployerFollowerApiService;

  /// Follow a candidate
  @PUT('/employers/followers/{candidateId}')
  Future<BaseResponse<void>> followCandidate(
    @Path('candidateId') String candidateId,
  );

  /// Unfollow a candidate
  @DELETE('/employers/followers/{candidateId}')
  Future<BaseResponse<void>> unfollowCandidate(
    @Path('candidateId') String candidateId,
  );

  /// Check if following a candidate
  @GET('/employers/followers/{candidateId}')
  Future<BaseResponse<bool>> isFollowed(
    @Path('candidateId') String candidateId,
  );

  /// Get list of followed candidates with pagination
  @GET('/employers/followers/')
  Future<BaseResponse<PageableResponse<CandidateProfileDto>>>
      getFollowedCandidates(
    @Query('page') int page,
    @Query('size') int size,
  );
}
