import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<void> saveWorkoutSession(WorkoutSession session);
  Future<List<WorkoutSession>> getWorkoutHistory();
  Future<WorkoutSession?> getWorkoutSessionById(String id);
  Future<void> deleteWorkoutSession(String id);
}
