import 'package:injectable/injectable.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../local/storage/local_storage_service.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ExerciseRepository)
class ExerciseRepositoryImpl implements ExerciseRepository {
  final LocalStorageService _storage;
  static const _key = 'exercises';

  ExerciseRepositoryImpl(this._storage);

  Future<void> _saveAll(List<Exercise> exercises) async {
    await _storage.save(_key, exercises.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    final data = _storage.read(_key);
    if (data == null) {
      // Return defaults
      final defaults = [
        Exercise(id: 'bench', name: 'Bench Press'),
        Exercise(id: 'squat', name: 'Barbell Squat'),
        Exercise(id: 'deadlift', name: 'Deadlift'),
        Exercise(id: 'ohp', name: 'Overhead Press'),
        Exercise(id: 'pullup', name: 'Pull-Up'),
        Exercise(id: 'row', name: 'Barbell Row'),
      ];
      await _saveAll(defaults);
      return defaults;
    }
    return (data as List).map((e) => Exercise.fromJson(e)).toList();
  }

  @override
  Future<List<Exercise>> searchExercises(String query) async {
    final exercises = await getAllExercises();
    if (query.isEmpty) return exercises;
    return exercises
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final exercises = await getAllExercises();
    try {
      return exercises.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Exercise> createCustomExercise(String name) async {
    final exercises = await getAllExercises();
    final exercise = Exercise(
      id: const Uuid().v4(),
      name: name,
      isCustom: true,
    );
    exercises.add(exercise);
    await _saveAll(exercises);
    return exercise;
  }
}
