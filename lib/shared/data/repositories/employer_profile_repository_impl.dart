import 'package:find_job_mobile/shared/data/api/employer_profile_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/create_employer_profile_request.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/employer_profile_repository.dart';

class EmployerProfileRepositoryImpl implements EmployerProfileRepository {
  final EmployerProfileApiService _apiService;

  EmployerProfileRepositoryImpl(this._apiService);

  @override
  Future<BaseResponse<EmployerProfileDto>> createProfile(
    CreateEmployerProfileRequest request,
  ) {
    return _apiService.createProfile(request);
  }

  @override
  Future<BaseResponse<EmployerProfileDto>> getProfile(String id) {
    return _apiService.getProfile(id);
  }

  @override
  Future<BaseResponse<EmployerProfileDto>> updateProfile(
    String id,
    CreateEmployerProfileRequest request,
  ) {
    return _apiService.updateProfile(id, request);
  }
}
