import 'package:drift/drift.dart';

@DataClassName('GymProfileModel')
class GymProfilesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get barWeightKg => real()();
  TextColumn get availablePlatesKgStr => text()(); 

  @override
  Set<Column> get primaryKey => {id};
}
