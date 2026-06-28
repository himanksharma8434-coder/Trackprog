import 'package:go_router/go_router.dart';
import '../../presentation/features/dashboard/screens/dashboard_screen.dart';
import '../../presentation/features/history/screens/history_screen.dart';
import '../../presentation/features/workout/screens/active_workout_screen.dart';
import '../../domain/entities/exercise.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/workout/active',
      builder: (context, state) {
        final exercises = state.extra as List<Exercise>?;
        return ActiveWorkoutScreen(preloadedExercises: exercises);
      },
    ),
  ],
);
