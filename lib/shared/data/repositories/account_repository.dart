import 'package:find_job_mobile/shared/data/api/account_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/reset_password_request.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';

class AccountRepository {
  final AccountApiService _apiService;

  AccountRepository(this._apiService);

  Future<BaseResponse<AccountDto>> getMyAccount() async {
    try {
      final response = await _apiService.getMyAccount();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> resetPassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final request = ResetPasswordRequest(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      final response = await _apiService.resetPassword(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
