import 'package:find_job_mobile/shared/data/api/job_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/create_job_request.dart';
import 'package:find_job_mobile/shared/data/dto/filter_job_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/job_dto.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';

class JobRepository {
  final JobApiService _apiService;

  JobRepository(this._apiService);

  Future<BaseResponse<JobDto>> createJob(CreateJobRequest request) async {
    try {
      return await _apiService.createJob(request);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<JobDto>> getJobById(String jobId) async {
    try {
      return await _apiService.getJobById(jobId);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<JobDto>> updateJobById(
    String jobId,
    CreateJobRequest request,
  ) async {
    try {
      return await _apiService.updateJobById(jobId, request);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<PageableResponse<JobDto>>> getAllOwnerJobs({
    int page = 0,
    int size = 5,
  }) async {
    try {
      return await _apiService.getAllOwnerJobs(page, size);
    } catch (e) {
      rethrow;
    }
  }

  /// Filter jobs with pagination
  Future<BaseResponse<PageableResponse<JobDto>>> getJobByFilter(
    FilterJobRequest filterData, {
    int page = 0,
    int size = 5,
  }) async {
    try {
      return await _apiService.getJobByFilter(filterData, page, size);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> deleteJobById(String jobId) async {
    try {
      return await _apiService.deleteJobById(jobId);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<PageableResponse<JobDto>>> getJobByEmployerId(
    String employerId, {
    int page = 0,
    int size = 6,
  }) async {
    try {
      return await _apiService.getJobByEmployerId(employerId, page, size);
    } catch (e) {
      rethrow;
    }
  }
}
