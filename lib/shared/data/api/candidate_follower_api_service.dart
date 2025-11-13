import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/saved_employer_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

part 'candidate_follower_api_service.g.dart';

@RestApi()
abstract class CandidateFollowerApiService {
  factory CandidateFollowerApiService(Dio dio, {String? baseUrl}) =
      _CandidateFollowerApiService;

  /// Follow an employer
  @PUT('/candidates/followers/{employerId}')
  Future<BaseResponse<void>> followEmployer(
    @Path('employerId') String employerId,
  );

  /// Unfollow an employer
  @DELETE('/candidates/followers/{employerId}')
  Future<BaseResponse<void>> unfollowEmployer(
    @Path('employerId') String employerId,
  );

  /// Check if following an employer
  @GET('/candidates/followers/{employerId}')
  Future<BaseResponse<bool>> isFollowed(
    @Path('employerId') String employerId,
  );

  /// Get list of followed employers with pagination
  @GET('/candidates/followers/')
  Future<BaseResponse<PageableResponse<SavedEmployerDto>>>
      getFollowedEmployers(
    @Query('page') int page,
    @Query('size') int size,
  );
}
