import 'package:injectable/injectable.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';
import '../local/storage/local_storage_service.dart';

@LazySingleton(as: WorkoutRepository)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final LocalStorageService _storage;
  static const _key = 'workout_sessions';

  WorkoutRepositoryImpl(this._storage);

  @override
  Future<void> saveWorkoutSession(WorkoutSession session) async {
    final sessions = await getWorkoutHistory();
    final index = sessions.indexWhere((s) => s.id == session.id);
    if (index >= 0) {
      sessions[index] = session;
    } else {
      sessions.add(session);
    }
    await _storage.save(_key, sessions.map((s) => s.toJson()).toList());
  }

  @override
  Future<List<WorkoutSession>> getWorkoutHistory() async {
    final data = _storage.read(_key);
    if (data == null) return [];
    return (data as List).map((e) => WorkoutSession.fromJson(e)).toList();
  }

  @override
  Future<WorkoutSession?> getWorkoutSessionById(String id) async {
    final sessions = await getWorkoutHistory();
    try {
      return sessions.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteWorkoutSession(String id) async {
    final sessions = await getWorkoutHistory();
    sessions.removeWhere((s) => s.id == id);
    await _storage.save(_key, sessions.map((s) => s.toJson()).toList());
  }

  @override
  Future<ExerciseLog?> getLastExerciseLog(String exerciseId) async {
    final sessions = await getWorkoutHistory();
    // Sort sessions descending by date
    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    
    for (final session in sessions) {
      for (final log in session.exerciseLogs) {
        if (log.exerciseId == exerciseId) {
          return log;
        }
      }
    }
    return null;
  }
}
