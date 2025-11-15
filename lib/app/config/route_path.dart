class RoutePath {
  // Splash screen
  static const String splash = '/';
  static const String main = '/main';

  // Auth routes
  static const String signIn = '/auth/sign-in';
  static const String signUp = '/auth/sign-up';
  static const String verify = '/auth/verify';

  // Setup routes
  static const String candidateProfile = '/set-up/candidate-profile';
  static const String employerProfile = '/set-up/employer-profile';

  // Find screens routes
  static const String findJob = '/community/job';
  static const String jobDetails = '/community/job/:jobId';
  static const String findCommunity = '/community/find';
  static const String jobDetail = '/community/job-detail';
  // Apply / upload CV route from job detail
  static const String jobApply = '/community/job-detail/apply';
  // Employer detail page
  static const String employerDetail = '/community/employer-detail';
  // Candidate detail page (view other user's profile)
  static const String candidateDetail = '/community/candidate-detail';
}
