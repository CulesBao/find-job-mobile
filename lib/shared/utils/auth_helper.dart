import 'dart:convert';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:find_job_mobile/shared/constants/api_constants.dart';
import 'package:find_job_mobile/shared/data/models/account_dto.dart';
import 'package:find_job_mobile/shared/data/models/candidate_profile_dto.dart';
import 'package:find_job_mobile/shared/data/models/employer_profile_dto.dart';
import 'package:find_job_mobile/shared/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper class for accessing authentication data from anywhere in the app
class AuthHelper {
  static AuthRepository get _authRepo => getIt<AuthRepository>();

  /// Get the current access token
  static String? get accessToken => _authRepo.getToken();

  /// Get the current logged-in user
  static AccountDto? get currentUser => _authRepo.getUser();

  /// Check if user is logged in
  static bool get isLoggedIn => _authRepo.isLoggedIn();

  /// Check if this is a new account
  static bool get isNewAccount => _authRepo.isNewAccount();

  /// Get user role
  static Role? get userRole => currentUser?.role;

  /// Check if user is a candidate
  static bool get isCandidate => userRole == Role.candidate;

  /// Check if user is an employer
  static bool get isEmployer => userRole == Role.employer;

  /// Check if user is an admin
  static bool get isAdmin => userRole == Role.admin;

  /// Logout and clear all stored data
  static Future<void> logout() async {
    await _authRepo.logout();
  }

  /// Save candidate profile to storage and update user data
  static Future<void> saveCandidateProfile(CandidateProfileDto profile) async {
    final prefs = getIt<SharedPreferences>();
    final user = currentUser;

    if (user != null) {
      // Update user with candidate profile
      final updatedUser = user.copyWith(candidateProfileDto: profile);
      final userJson = jsonEncode(updatedUser.toJson());
      await prefs.setString(ApiConstants.userKey, userJson);
    }
  }

  /// Get candidate profile from current user
  static CandidateProfileDto? get candidateProfile =>
      currentUser?.candidateProfileDto;

  /// Save employer profile to storage and update user data
  static Future<void> saveEmployerProfile(EmployerProfileDto profile) async {
    final prefs = getIt<SharedPreferences>();
    final user = currentUser;

    if (user != null) {
      // Update user with employer profile
      final updatedUser = user.copyWith(employerProfileDto: profile);
      final userJson = jsonEncode(updatedUser.toJson());
      await prefs.setString(ApiConstants.userKey, userJson);
    }
  }

  /// Get employer profile from current user
  static EmployerProfileDto? get employerProfile =>
      currentUser?.employerProfileDto;
}
