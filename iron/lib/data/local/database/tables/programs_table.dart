import 'package:drift/drift.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/workout.dart';

@DataClassName('ProgramModel')
class ProgramsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get author => text().nullable()();
  BoolColumn get isCustom => boolean()();
  BoolColumn get isImported => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramDayModel')
class ProgramDaysTable extends Table {
  TextColumn get id => text()();
  TextColumn get programId => text().references(ProgramsTable, #id)();
  IntColumn get dayNumber => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramExerciseModel')
class ProgramExercisesTable extends Table {
  TextColumn get id => text()();
  TextColumn get dayId => text().references(ProgramDaysTable, #id)();
  TextColumn get exerciseId => text()();
  TextColumn get exerciseName => text()();
  IntColumn get restSeconds => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramSetModel')
class ProgramSetsTable extends Table {
  TextColumn get id => text()();
  TextColumn get exerciseId => text().references(ProgramExercisesTable, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get targetReps => integer().nullable()();
  RealColumn get targetWeight => real().nullable()();
  RealColumn get targetRpe => real().nullable()();
  IntColumn get setType => integer().map(const EnumIndexConverter<SetType>(SetType.values)).withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
