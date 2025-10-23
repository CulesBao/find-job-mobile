import 'package:shared_preferences/shared_preferences.dart';
import 'package:find_job_mobile/shared/constants/api_constants.dart';
import 'package:find_job_mobile/shared/data/api/auth_api_service.dart';
import 'package:find_job_mobile/shared/data/dto/login_request.dart';
import 'package:find_job_mobile/shared/data/dto/register_request.dart';
import 'package:find_job_mobile/shared/data/dto/verify_code_request.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/auth_response.dart';
import 'package:find_job_mobile/shared/data/models/base_response.dart';

class AuthRepository {
  final AuthApiService _authApiService;
  final SharedPreferences _prefs;

  AuthRepository(this._authApiService, this._prefs);

  Future<BaseResponse<AccountDto>> register(RegisterRequest request) async {
    try {
      final response = await _authApiService.register(request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await _authApiService.login(request);

      // Save token and account data
      if (response.data != null) {
        await _saveAuthData(response.data!);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<void>> verifyCode(String accountId, String code) async {
    try {
      final request = VerifyCodeRequest(code: code);
      final response = await _authApiService.verifyCode(accountId, request);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authApiService.logout();
    } catch (e) {
      // Ignore error on logout
    } finally {
      await _clearAuthData();
    }
  }

  Future<void> _saveAuthData(AuthResponse authResponse) async {
    await _prefs.setString(ApiConstants.tokenKey, authResponse.token);
    await _prefs.setBool(
      ApiConstants.isNewAccountKey,
      authResponse.isNewAccount,
    );
    // TODO: Save account data as JSON if needed
  }

  Future<void> _clearAuthData() async {
    await _prefs.remove(ApiConstants.tokenKey);
    await _prefs.remove(ApiConstants.accountDataKey);
    await _prefs.remove(ApiConstants.isNewAccountKey);
  }

  String? getToken() {
    return _prefs.getString(ApiConstants.tokenKey);
  }

  bool isLoggedIn() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }
}
