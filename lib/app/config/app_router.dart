import 'package:find_job_mobile/modules/auth/screens/sign_in_screen.dart';
import 'package:find_job_mobile/modules/auth/screens/sign_up_screen.dart';

import 'package:go_router/go_router.dart';
import 'route_path.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.signIn,
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
  ],
);
