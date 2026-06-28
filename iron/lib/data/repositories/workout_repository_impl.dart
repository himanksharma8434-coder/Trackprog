import 'package:injectable/injectable.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';
import '../local/database/app_database.dart';
import 'package:drift/drift.dart';

@LazySingleton(as: WorkoutRepository)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final AppDatabase _db;

  WorkoutRepositoryImpl(this._db);

  @override
  Future<void> saveWorkoutSession(WorkoutSession session) async {
    await _db.into(_db.workoutSessionsTable).insert(
      WorkoutSessionsTableCompanion.insert(
        id: session.id,
        programDayId: Value(session.programDayId),
        name: session.name,
        startedAt: session.startedAt,
        finishedAt: Value(session.finishedAt),
        durationSeconds: Value(session.durationSeconds),
        totalVolumeKg: Value(session.totalVolumeKg),
        sessionRpe: Value(session.sessionRpe),
        note: Value(session.note),
      ),
      mode: InsertMode.insertOrReplace,
    );

    for (var i = 0; i < session.exerciseLogs.length; i++) {
      final log = session.exerciseLogs[i];
      await _db.into(_db.exerciseLogsTable).insert(
        ExerciseLogsTableCompanion.insert(
          id: log.id,
          workoutSessionId: session.id,
          exerciseId: log.exerciseId,
          exerciseName: log.exerciseName,
          orderInSession: log.orderInSession,
        ),
        mode: InsertMode.insertOrReplace,
      );

      for (var s in log.sets) {
        await _db.into(_db.setLogsTable).insert(
          SetLogsTableCompanion.insert(
            id: s.id,
            exerciseLogId: log.id,
            setNumber: s.setNumber,
            type: s.type,
            weightKg: s.weightKg,
            reps: s.reps,
            rir: Value(s.rir),
            partialReps: Value(s.partialReps),
            isLeft: Value(s.isLeft),
            isRight: Value(s.isRight),
            loggedAt: s.loggedAt,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    }
  }

  @override
  Future<List<WorkoutSession>> getWorkoutHistory() async => [];

  @override
  Future<WorkoutSession?> getWorkoutSessionById(String id) async => null;

  @override
  Future<void> deleteWorkoutSession(String id) async {}

  @override
  Future<ExerciseLog?> getLastExerciseLog(String exerciseId) async {
    // Join ExerciseLogs and WorkoutSessions to get the most recent one
    final query = _db.select(_db.exerciseLogsTable).join([
      innerJoin(
        _db.workoutSessionsTable,
        _db.workoutSessionsTable.id.equalsExp(_db.exerciseLogsTable.workoutSessionId),
      )
    ])
      ..where(_db.exerciseLogsTable.exerciseId.equals(exerciseId))
      ..orderBy([OrderingTerm.desc(_db.workoutSessionsTable.startedAt)])
      ..limit(1);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final logModel = result.readTable(_db.exerciseLogsTable);
    
    // Get sets
    final setsResult = await (_db.select(_db.setLogsTable)..where((t) => t.exerciseLogId.equals(logModel.id))).get();
    
    final sets = setsResult.map((s) => SetLog(
      id: s.id,
      setNumber: s.setNumber,
      type: s.type,
      weightKg: s.weightKg,
      reps: s.reps,
      rir: s.rir,
      partialReps: s.partialReps,
      isLeft: s.isLeft,
      isRight: s.isRight,
      loggedAt: s.loggedAt,
    )).toList();

    return ExerciseLog(
      id: logModel.id,
      exerciseId: logModel.exerciseId,
      exerciseName: logModel.exerciseName,
      sets: sets,
      orderInSession: logModel.orderInSession,
    );
  }
}
