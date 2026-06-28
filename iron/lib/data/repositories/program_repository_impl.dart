import 'package:injectable/injectable.dart';
import '../../domain/entities/program.dart';
import '../../domain/repositories/program_repository.dart';
import '../local/database/app_database.dart';
import 'package:drift/drift.dart';

@LazySingleton(as: ProgramRepository)
class ProgramRepositoryImpl implements ProgramRepository {
  final AppDatabase _db;

  ProgramRepositoryImpl(this._db);

  @override
  Future<void> saveProgram(Program program) async {
    await _db.transaction(() async {
      await _db.into(_db.programsTable).insert(
        ProgramsTableCompanion.insert(
          id: program.id,
          name: program.name,
          author: Value(program.author),
          isCustom: program.isCustom,
          isImported: program.isImported,
          createdAt: program.createdAt,
        ),
        mode: InsertMode.insertOrReplace,
      );

      // We should probably delete existing days/exercises/sets to avoid orphans
      // but for now let's just insert/replace assuming ID collisions are managed.
      // Better approach: wipe existing children if updating
      await (_db.delete(_db.programDaysTable)..where((t) => t.programId.equals(program.id))).go();

      for (final day in program.days) {
        await _db.into(_db.programDaysTable).insert(
          ProgramDaysTableCompanion.insert(
            id: day.id,
            programId: program.id,
            dayNumber: day.dayNumber,
            name: day.name,
          ),
        );

        for (final exercise in day.exercises) {
          await _db.into(_db.programExercisesTable).insert(
            ProgramExercisesTableCompanion.insert(
              id: exercise.id,
              dayId: day.id,
              exerciseId: exercise.exerciseId,
              exerciseName: exercise.exerciseName,
              restSeconds: exercise.restSeconds,
            ),
          );

          for (final pSet in exercise.sets) {
            await _db.into(_db.programSetsTable).insert(
              ProgramSetsTableCompanion.insert(
                id: pSet.id,
                exerciseId: exercise.id,
                setNumber: pSet.setNumber,
                targetReps: Value(pSet.targetReps),
                targetWeight: Value(pSet.targetWeight),
                targetRpe: Value(pSet.targetRpe),
                setType: Value(pSet.setType),
              ),
            );
          }
        }
      }
    });
  }

  @override
  Future<Program?> getActiveProgram() async {
    // Return the most recently created custom program for now, or null if none
    final programs = await getAllPrograms();
    if (programs.isNotEmpty) {
      return programs.first;
    }
    return null;
  }

  @override
  Future<List<Program>> getAllPrograms() async {
    final progModels = await _db.select(_db.programsTable).get();
    
    final List<Program> programs = [];
    for (final p in progModels) {
      final dayModels = await (_db.select(_db.programDaysTable)..where((t) => t.programId.equals(p.id))).get();
      
      final List<ProgramDay> days = [];
      for (final d in dayModels) {
        final exerciseModels = await (_db.select(_db.programExercisesTable)..where((t) => t.dayId.equals(d.id))).get();
        
        final List<ProgramExercise> exercises = [];
        for (final e in exerciseModels) {
          final setModels = await (_db.select(_db.programSetsTable)..where((t) => t.exerciseId.equals(e.id))).get();
          
          final sets = setModels.map((s) => ProgramSet(
            id: s.id,
            setNumber: s.setNumber,
            targetReps: s.targetReps,
            targetWeight: s.targetWeight,
            targetRpe: s.targetRpe,
            setType: s.setType,
          )).toList();
          
          exercises.add(ProgramExercise(
            id: e.id,
            exerciseId: e.exerciseId,
            exerciseName: e.exerciseName,
            sets: sets,
            restSeconds: e.restSeconds,
          ));
        }
        
        days.add(ProgramDay(
          id: d.id,
          dayNumber: d.dayNumber,
          name: d.name,
          exercises: exercises,
        ));
      }

      programs.add(Program(
        id: p.id,
        name: p.name,
        author: p.author,
        isCustom: p.isCustom,
        isImported: p.isImported,
        createdAt: p.createdAt,
        days: days,
      ));
    }
    
    return programs;
  }

  @override
  Future<void> deleteProgram(String id) async {
    await (_db.delete(_db.programsTable)..where((t) => t.id.equals(id))).go();
  }
}
