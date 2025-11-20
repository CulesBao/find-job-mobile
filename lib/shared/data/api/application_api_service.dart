import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';

part 'application_api_service.g.dart';

@RestApi()
abstract class ApplicationApiService {
  factory ApplicationApiService(Dio dio, {String baseUrl}) =
      _ApplicationApiService;

  /// Withdraw an application
  @PUT('/application/{applicationId}/withdraw')
  Future<BaseResponse<void>> withdrawApplication(
    @Path('applicationId') String applicationId,
  );

  /// Get candidate's applications with pagination
  @GET('/application/')
  Future<BaseResponse<PageableResponse<AppliedJobDto>>> getCandidateApplications({
    @Query('page') int page = 0,
    @Query('limit') int limit = 10,
  });

  /// Get employer's applications for a specific job
  @GET('/application/job/{jobId}')
  Future<BaseResponse<PageableResponse<ApplicationDto>>> getEmployerApplications(
    @Path('jobId') String jobId, {
    @Query('jobProcess') String? jobProcess,
    @Query('page') int page = 0,
    @Query('limit') int limit = 10,
  });

  /// Get application by ID
  @GET('/application/{applicationId}')
  Future<BaseResponse<ApplicationDto>> getApplicationById(
    @Path('applicationId') String applicationId,
  );

  /// Update application status (batch update)
  @PUT('/application/job/{jobId}')
  Future<BaseResponse<void>> updateApplicationStatus(
    @Path('jobId') String jobId,
    @Body() Map<String, dynamic> body,
  );

  /// Get application status for a job
  @GET('/application/job/{jobId}/status')
  Future<BaseResponse<ApplicationStatusDto>> getApplicationStatus(
    @Path('jobId') String jobId,
  );
}
