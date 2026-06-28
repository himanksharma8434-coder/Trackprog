import 'package:injectable/injectable.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';

@LazySingleton(as: WorkoutRepository)
class WorkoutRepositoryImpl implements WorkoutRepository {
  @override
  Future<void> saveWorkoutSession(WorkoutSession session) async {}

  @override
  Future<List<WorkoutSession>> getWorkoutHistory() async => [];

  @override
  Future<WorkoutSession?> getWorkoutSessionById(String id) async => null;

  @override
  Future<void> deleteWorkoutSession(String id) async {}
}
