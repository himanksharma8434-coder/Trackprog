import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../presentation/features/onboarding/screens/splash_screen.dart';
import '../../presentation/features/onboarding/screens/onboarding_survey_screen.dart';
import '../../presentation/features/onboarding/screens/gym_profile_setup_screen.dart';
import '../../presentation/features/programs/screens/program_builder_screen.dart';
import '../../presentation/features/workout/screens/active_workout_screen.dart';
import '../../presentation/features/analytics/screens/analytics_screen.dart';
import '../../presentation/features/body_metrics/screens/body_weight_screen.dart';
import '../../presentation/features/dashboard/screens/dashboard_screen.dart';
import '../../presentation/features/dashboard/screens/home_tab.dart';
import '../../presentation/features/settings/screens/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingSurveyScreen(),
    ),
    GoRoute(
      path: '/onboarding/gym',
      builder: (context, state) => const GymProfileSetupScreen(),
    ),
    GoRoute(
      path: '/program-builder',
      builder: (context, state) => const ProgramBuilderScreen(),
    ),
    GoRoute(
      path: '/workout/active',
      builder: (context, state) => const ActiveWorkoutScreen(),
    ),
    GoRoute(
      path: '/body-weight',
      builder: (context, state) => const BodyWeightScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => DashboardScreen(child: child),
      routes: [
        GoRoute(
          path: '/dashboard/home',
          builder: (context, state) => const HomeTab(),
        ),
        GoRoute(
          path: '/dashboard/programs',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Programs Tab Placeholder'))),
        ),
        GoRoute(
          path: '/dashboard/analytics',
          builder: (context, state) => const AnalyticsScreen(),
        ),
        GoRoute(
          path: '/dashboard/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
