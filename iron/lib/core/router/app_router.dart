import 'package:go_router/go_router.dart';
import '../../presentation/features/history/screens/history_screen.dart';
import '../../presentation/features/workout/screens/active_workout_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/workout/active',
      builder: (context, state) => const ActiveWorkoutScreen(),
    ),
  ],
);
