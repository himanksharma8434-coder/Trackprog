import 'package:drift/drift.dart';

@DataClassName('ExerciseModel')
class ExercisesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  
  @override
  Set<Column> get primaryKey => {id};
}
