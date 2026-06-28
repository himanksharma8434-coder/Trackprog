import '../entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getAllExercises();
  Future<List<Exercise>> searchExercises(String query);
  Future<Exercise?> getExerciseById(String id);
  Future<Exercise> createCustomExercise(String name);
}
