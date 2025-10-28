import 'package:find_job_mobile/modules/auth/screens/sign_in_screen.dart';
import 'package:find_job_mobile/modules/auth/screens/sign_up_screen.dart';
import 'package:find_job_mobile/modules/auth/screens/verify_screen.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_candidate_profile.dart';
import 'package:find_job_mobile/modules/setup/screens/setup_screen_employer_profile.dart';

import 'package:go_router/go_router.dart';
import 'route_path.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.employerProfile,
  routes: <GoRoute>[
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
  ],
);
