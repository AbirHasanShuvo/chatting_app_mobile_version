import 'package:go_router/go_router.dart';
import 'package:snapchat_mobile/features/authentication/presentation/views/login_screen.dart';
import 'package:snapchat_mobile/features/authentication/presentation/views/registration_screen.dart';

import '../features/authentication/presentation/views/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
