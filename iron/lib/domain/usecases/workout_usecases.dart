import 'package:injectable/injectable.dart';
import '../entities/workout.dart';
import '../repositories/workout_repository.dart';

@injectable
class StartWorkoutSessionUseCase {
  final WorkoutRepository repository;
  StartWorkoutSessionUseCase(this.repository);

  Future<void> call(WorkoutSession session) => repository.saveWorkoutSession(session);
}

@injectable
class CompleteWorkoutUseCase {
  final WorkoutRepository repository;
  CompleteWorkoutUseCase(this.repository);

  Future<void> call(WorkoutSession session) => repository.saveWorkoutSession(session);
}

@injectable
class GetWorkoutHistoryUseCase {
  final WorkoutRepository repository;
  GetWorkoutHistoryUseCase(this.repository);

  Future<List<WorkoutSession>> call() => repository.getWorkoutHistory();
}
