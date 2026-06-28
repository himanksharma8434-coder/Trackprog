import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/exercises_table.dart';
import '../../../../domain/entities/exercise.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [ExercisesTable])
class ExerciseDao extends DatabaseAccessor<AppDatabase> with _$ExerciseDaoMixin {
  ExerciseDao(AppDatabase db) : super(db);

  Future<List<Exercise>> getAllExercises() async {
    final rows = await select(exercisesTable).get();
    return rows.map((r) => Exercise(id: r.id, name: r.name, isCustom: r.isCustom)).toList();
  }

  Future<List<Exercise>> searchExercises(String query) async {
    final rows = await (select(exercisesTable)..where((t) => t.name.like('%$query%'))).get();
    return rows.map((r) => Exercise(id: r.id, name: r.name, isCustom: r.isCustom)).toList();
  }

  Future<Exercise?> getExerciseById(String id) async {
    final row = await (select(exercisesTable)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return Exercise(id: row.id, name: row.name, isCustom: row.isCustom);
  }

  Future<void> insertExercise(Exercise exercise) async {
    await into(exercisesTable).insert(
      ExercisesTableCompanion.insert(
        id: exercise.id,
        name: exercise.name,
        isCustom: Value(exercise.isCustom),
      ),
      mode: InsertMode.replace,
    );
  }
}
