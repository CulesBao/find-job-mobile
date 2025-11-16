import 'package:find_job_mobile/modules/auth/screens/sign_in_screen.dart';
import 'package:find_job_mobile/modules/auth/screens/sign_up_screen.dart';
import 'package:find_job_mobile/modules/auth/screens/verify_screen.dart';
import 'package:find_job_mobile/modules/community/pages/find_job_page.dart';
import 'package:find_job_mobile/modules/detail/pages/job_detail_page.dart';
import 'package:find_job_mobile/modules/detail/pages/upload_cv_page.dart';
import 'package:find_job_mobile/modules/detail/pages/employer_detail_page.dart';
import 'package:find_job_mobile/modules/detail/pages/candidate_detail_page.dart';
import 'package:find_job_mobile/modules/community/pages/find_community.dart';
import 'package:find_job_mobile/modules/job_details/pages/job_details_page.dart';
import 'package:find_job_mobile/modules/main/screens/main_screen.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_candidate_profile.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_employer_profile.dart';
import 'package:find_job_mobile/modules/splash/screens/splash_screen.dart';

import 'package:go_router/go_router.dart';
import 'route_path.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.splash,
  routes: <GoRoute>[
    GoRoute(
      name: 'splash',
      path: RoutePath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'main',
      path: RoutePath.main,
      builder: (context, state) {
        // Parse query parameter to set initial tab
        final tabParam = state.uri.queryParameters['tab'];
        int? initialTab;

        if (tabParam == 'dashboard') {
          initialTab = 0;
        } else if (tabParam == 'find') {
          initialTab = 1;
        } else if (tabParam == 'notification') {
          initialTab = 2;
        } else if (tabParam == 'setting') {
          initialTab = 3;
        }

        return MainScreen(initialTab: initialTab);
      },
    ),
    GoRoute(
      name: 'sign-in',
      path: RoutePath.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: 'sign-up',
      path: RoutePath.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: 'verify',
      path: RoutePath.verify,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return VerifyScreen(
          accountId: extra?['accountId'] ?? '',
          email: extra?['email'] ?? '',
        );
      },
    ),
    GoRoute(
      name: 'candidate-profile',
      path: RoutePath.candidateProfile,
      builder: (context, state) => const SetupScreenCandidateProfile(),
    ),
    GoRoute(
      name: 'employer-profile',
      path: RoutePath.employerProfile,
      builder: (context, state) => const SetupScreenEmployerProfile(),
    ),
    GoRoute(
      name: 'find-job',
      path: RoutePath.findJob,
      builder: (context, state) => const FindCommunityPage(),
    ),

    GoRoute(
      name: 'job-detail',
      path: RoutePath.jobDetail,
      builder: (context, state) => const JobDetailPage(),
    ),
    GoRoute(
      name: 'job-apply',
      path: RoutePath.jobApply,
      builder: (context, state) => const UploadCvPage(),
    ),
    GoRoute(
      name: 'employer-detail',
      path: RoutePath.employerDetail,
      builder: (context, state) => const EmployerDetailPage(),
    ),
    GoRoute(
      name: 'candidate-detail',
      path: RoutePath.candidateDetail,
      builder: (context, state) => const CandidateDetailPage(),
    ),
  ],
);
