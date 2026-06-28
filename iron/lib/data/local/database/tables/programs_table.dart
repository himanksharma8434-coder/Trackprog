import 'package:drift/drift.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/workout.dart';

@DataClassName('ProgramModel')
class ProgramsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get author => text().nullable()();
  IntColumn get totalWeeks => integer()();
  BoolColumn get isCustom => boolean()();
  BoolColumn get isImported => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramBlockModel')
class ProgramBlocksTable extends Table {
  TextColumn get id => text()();
  TextColumn get programId => text().references(ProgramsTable, #id)();
  TextColumn get name => text()();
  IntColumn get weeks => integer()();
  IntColumn get type => integer().map(const EnumIndexConverter<BlockType>(BlockType.values))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramSessionModel')
class ProgramSessionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get blockId => text().references(ProgramBlocksTable, #id)();
  IntColumn get dayOfWeek => integer()();
  TextColumn get name => text()();
  IntColumn get estimatedDurationMinutes => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProgramExerciseModel')
class ProgramExercisesTable extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text().references(ProgramSessionsTable, #id)();
  TextColumn get exerciseId => text()();
  TextColumn get exerciseName => text()();
  IntColumn get sets => integer()();
  IntColumn get repMin => integer()();
  IntColumn get repMax => integer()();
  IntColumn get rirTarget => integer().nullable()();
  IntColumn get restSeconds => integer()();
  
  TextColumn get allowedSetTypesStr => text().withDefault(const Constant('0'))(); 

  @override
  Set<Column> get primaryKey => {id};
}
