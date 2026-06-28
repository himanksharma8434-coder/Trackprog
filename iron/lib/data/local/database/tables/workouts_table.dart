import 'package:drift/drift.dart';
import '../../../../domain/entities/workout.dart';

@DataClassName('WorkoutSessionModel')
class WorkoutSessionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get programDayId => text().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  RealColumn get totalVolumeKg => real().withDefault(const Constant(0.0))();
  IntColumn get sessionRpe => integer().nullable()();
  TextColumn get note => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ExerciseLogModel')
class ExerciseLogsTable extends Table {
  TextColumn get id => text()();
  TextColumn get workoutSessionId => text().references(WorkoutSessionsTable, #id)();
  TextColumn get exerciseId => text()();
  TextColumn get exerciseName => text()();
  IntColumn get orderInSession => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SetLogModel')
class SetLogsTable extends Table {
  TextColumn get id => text()();
  TextColumn get exerciseLogId => text().references(ExerciseLogsTable, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get type => integer().map(const EnumIndexConverter<SetType>(SetType.values))();
  RealColumn get weightKg => real()();
  IntColumn get reps => integer()();
  IntColumn get rir => integer().nullable()();
  IntColumn get partialReps => integer().nullable()();
  BoolColumn get isLeft => boolean().nullable()();
  BoolColumn get isRight => boolean().nullable()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
