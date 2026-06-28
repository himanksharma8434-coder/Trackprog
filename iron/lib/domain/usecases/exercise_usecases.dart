import 'package:injectable/injectable.dart';
import '../entities/exercise.dart';
import '../repositories/exercise_repository.dart';

@injectable
class GetExercisesUseCase {
  final ExerciseRepository repository;
  GetExercisesUseCase(this.repository);

  Future<List<Exercise>> call() => repository.getAllExercises();
}

@injectable
class SearchExercisesUseCase {
  final ExerciseRepository repository;
  SearchExercisesUseCase(this.repository);

  Future<List<Exercise>> call(String query) => repository.searchExercises(query);
}

@injectable
class CreateCustomExerciseUseCase {
  final ExerciseRepository repository;
  CreateCustomExerciseUseCase(this.repository);

  Future<Exercise> call(String name) => repository.createCustomExercise(name);
}
