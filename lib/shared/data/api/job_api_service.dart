import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';
import 'package:find_job_mobile/shared/data/dto/create_job_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_job_request.dart';

part 'job_api_service.g.dart';

@RestApi()
abstract class JobApiService {
  factory JobApiService(Dio dio, {String? baseUrl}) = _JobApiService;

  @POST('/job/')
  Future<BaseResponse<JobDto>> createJob(@Body() CreateJobRequest request);

  @GET('/job/{jobId}')
  Future<BaseResponse<JobDto>> getJobById(@Path('jobId') String jobId);

  @PUT('/job/{jobId}')
  Future<BaseResponse<JobDto>> updateJobById(
    @Path('jobId') String jobId,
    @Body() CreateJobRequest request,
  );

  @GET('/job/')
  Future<BaseResponse<PageableResponse<JobDto>>> getAllOwnerJobs(
    @Query('page') int page,
    @Query('size') int size,
  );

  @POST('/job/filter')
  Future<BaseResponse<PageableResponse<JobDto>>> getJobByFilter(
    @Body() FilterJobRequest filterData,
    @Query('page') int page,
    @Query('size') int size,
  );

  @DELETE('/job/{jobId}')
  Future<BaseResponse<void>> deleteJobById(@Path('jobId') String jobId);

  @GET('/job/employer/{employerId}')
  Future<BaseResponse<PageableResponse<JobDto>>> getJobByEmployerId(
    @Path('employerId') String employerId,
    @Query('page') int page,
    @Query('size') int size,
  );
}
