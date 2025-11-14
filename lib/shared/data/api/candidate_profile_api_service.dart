import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_filter_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';
import 'package:find_job_mobile/shared/data/dto/create_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_candidate_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';

part 'candidate_profile_api_service.g.dart';

@RestApi()
abstract class CandidateProfileApiService {
  factory CandidateProfileApiService(Dio dio, {String? baseUrl}) =
      _CandidateProfileApiService;

  @POST('/candidate-profile/')
  Future<BaseResponse<CandidateProfileDto>> createProfile(
    @Body() CreateCandidateProfileRequest request,
  );

  @PUT('/candidate-profile/')
  Future<BaseResponse<void>> updateProfile(
    @Body() CreateCandidateProfileRequest request,
  );

  @GET('/candidate-profile/{candidateProfileId}')
  Future<BaseResponse<CandidateProfileDto>> getProfile(
    @Path('candidateProfileId') String candidateProfileId,
  );

  @PUT('/candidate-profile/social-links')
  Future<BaseResponse<void>> updateSocialLinks(
    @Body() UpdateSocialLinksRequest request,
  );

  @PUT('/candidate-profile/update-avatar')
  @MultiPart()
  Future<BaseResponse<void>> updateAvatar(@Part(name: 'avatar') File avatar);

  @GET('/candidate-profile/filter')
  Future<BaseResponse<PageableResponse<CandidateFilterDto>>> filterCandidateProfile(
    @Queries() FilterCandidateProfileRequest filter,
    @Query('page') int page,
    @Query('size') int size,
  );
}
