import 'package:injectable/injectable.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../local/database/daos/exercise_dao.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ExerciseRepository)
class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseDao dao;
  ExerciseRepositoryImpl(this.dao);

  @override
  Future<List<Exercise>> getAllExercises() => dao.getAllExercises();

  @override
  Future<List<Exercise>> searchExercises(String query) => dao.searchExercises(query);

  @override
  Future<Exercise?> getExerciseById(String id) => dao.getExerciseById(id);

  @override
  Future<Exercise> createCustomExercise(String name) async {
    final exercise = Exercise(
      id: const Uuid().v4(),
      name: name,
      isCustom: true,
    );
    await dao.insertExercise(exercise);
    return exercise;
  }
}
