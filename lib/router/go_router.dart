import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snapchat_mobile/features/authentication/data/models/user_model.dart';
import 'package:snapchat_mobile/features/authentication/presentation/views/login_screen.dart';
import 'package:snapchat_mobile/features/authentication/presentation/views/registration_screen.dart';
import 'package:snapchat_mobile/features/home/presentation/views/home_screen.dart';
import 'package:snapchat_mobile/features/message/presesntation/views/message_screen.dart';

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
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    // GoRoute(
    //   path: '/message',
    //   builder: (context, state) {
    //     final user = state.extra as UserModel;
    //     return MessageScreen(user: user);
    //   },
    // ),
    GoRoute(
      path: '/message',
      builder: (context, state) {
        // 1. Check if extra is actually a UserModel
        if (state.extra is UserModel) {
          final user = state.extra as UserModel;
          return MessageScreen(user: user);
        }

        // 2. Fallback UI if state.extra is null or wrong type
        return const Scaffold(
          body: Center(child: Text('Error: User data is missing or invalid.')),
        );
      },
    ),
  ],
);
