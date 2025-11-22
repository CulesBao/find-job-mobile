import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_job_mobile/shared/data/api/application_api_service.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/pageable_response.dart';
import 'package:find_job_mobile/shared/data/models/application_dto.dart';

class ApplicationRepository {
  final ApplicationApiService _apiService;
  final Dio _dio;

  ApplicationRepository(this._apiService, this._dio);

  /// Create a new job application
  /// Uploads resume file, cover letter, and job ID
  Future<BaseResponse<ApplicationDto>> createApplication({
    required File resumeFile,
    required String coverLetter,
    required String jobId,
  }) async {
    try {
      // Create FormData manually
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          resumeFile.path,
          filename: resumeFile.path.split('/').last,
        ),
        'cover_letter': coverLetter,
        'job_id': jobId,
      });

      // Make direct Dio call
      final response = await _dio.post<Map<String, dynamic>>(
        '/application/',
        data: formData,
      );

      return BaseResponse<ApplicationDto>.fromJson(
        response.data!,
        (json) => ApplicationDto.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Withdraw an application
  Future<BaseResponse<void>> withdrawApplication(String applicationId) async {
    try {
      return await _apiService.withdrawApplication(applicationId);
    } catch (e) {
      rethrow;
    }
  }

  /// Get candidate's applications with pagination
  Future<BaseResponse<PageableResponse<AppliedJobDto>>>
  getCandidateApplications({int page = 0, int limit = 10}) async {
    try {
      return await _apiService.getCandidateApplications(
        page: page,
        limit: limit,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Get employer's applications for a specific job
  Future<BaseResponse<PageableResponse<ApplicationDto>>>
  getEmployerApplications({
    required String jobId,
    String? jobProcess,
    int page = 0,
    int limit = 10,
  }) async {
    try {
      return await _apiService.getEmployerApplications(
        jobId,
        jobProcess: jobProcess,
        page: page,
        limit: limit,
        populate: 'candidate_profile',
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Get application by ID
  Future<BaseResponse<ApplicationDto>> getApplicationById(
    String applicationId,
  ) async {
    try {
      return await _apiService.getApplicationById(applicationId);
    } catch (e) {
      rethrow;
    }
  }

  /// Update application status (batch update)
  /// applications should be a list of {application_id, job_process}
  Future<BaseResponse<void>> updateApplicationStatus({
    required String jobId,
    required List<Map<String, dynamic>> applications,
  }) async {
    try {
      return await _apiService.updateApplicationStatus(jobId, {
        'applications': applications,
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Get application status for a job (check if candidate has applied)
  Future<BaseResponse<bool>> getApplicationStatus(String jobId) async {
    try {
      // Use API service to get application status
      final response = await _apiService.getApplicationStatus(jobId);

      // Extract hasApplied from ApplicationStatusDto
      return BaseResponse<bool>(
        message: response.message,
        data: response.data?.hasApplied ?? false,
        success: response.success,
      );
    } catch (e) {
      rethrow;
    }
  }
}
