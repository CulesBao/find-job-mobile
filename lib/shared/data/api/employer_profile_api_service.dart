import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/dto/update_social_links_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'employer_profile_api_service.g.dart';

@RestApi()
abstract class EmployerProfileApiService {
  factory EmployerProfileApiService(Dio dio) = _EmployerProfileApiService;

  @POST('/employer-profile/')
  Future<BaseResponse<EmployerProfileDto>> createProfile(
    @Body() CreateEmployerProfileRequest request,
  );

  @GET('/employer-profile/{id}')
  Future<BaseResponse<EmployerProfileDto>> getProfile(@Path('id') String id);

  @PUT('/employer-profile/')
  Future<BaseResponse<dynamic>> updateProfile(
    @Body() CreateEmployerProfileRequest request,
  );

  @PUT('/employer-profile/social-links')
  Future<BaseResponse<dynamic>> updateSocialLinks(
    @Body() UpdateSocialLinksRequest request,
  );

  @MultiPart()
  @PUT('/employer-profile/update-logo')
  Future<BaseResponse<dynamic>> updateLogo(@Part(name: 'logo') File logo);
}
