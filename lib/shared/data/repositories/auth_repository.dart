import 'dart:convert';
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
    // Save accessToken (matching web localStorage key)
    await _prefs.setString(ApiConstants.accessTokenKey, authResponse.token);

    // Save user as JSON string (matching web localStorage key)
    final userJson = jsonEncode(authResponse.accountDto.toJson());
    await _prefs.setString(ApiConstants.userKey, userJson);

    // Save is_new_account flag
    await _prefs.setBool(
      ApiConstants.isNewAccountKey,
      authResponse.isNewAccount,
    );
  }

  Future<void> _clearAuthData() async {
    await _prefs.remove(ApiConstants.accessTokenKey);
    await _prefs.remove(ApiConstants.userKey);
    await _prefs.remove(ApiConstants.isNewAccountKey);
  }

  String? getToken() {
    return _prefs.getString(ApiConstants.accessTokenKey);
  }

  AccountDto? getUser() {
    final userJson = _prefs.getString(ApiConstants.userKey);
    if (userJson != null) {
      try {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        return AccountDto.fromJson(userMap);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  bool isLoggedIn() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }

  bool isNewAccount() {
    return _prefs.getBool(ApiConstants.isNewAccountKey) ?? false;
  }
}
