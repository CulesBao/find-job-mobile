class ApiConstants {
  static const String baseUrl = 'http://localhost:8080/api';

  // Timeout
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';

  // Auth endpoints
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String verify = '/auth/verify';
  static const String logout = '/auth/logout';

  // Job endpoints
  static const String jobs = '/job';
  static const String jobFilter = '/job/filter';

  // User endpoints
  static const String account = '/account';
  static const String candidateProfile = '/candidate-profile';
  static const String employerProfile = '/employer-profile';

  // Location endpoints
  static const String provinces = '/provinces';
  static const String districts = '/districts';

  // Storage keys
  static const String tokenKey = 'token';
  static const String accountDataKey = 'account_data';
  static const String isNewAccountKey = 'is_new_account';
}
