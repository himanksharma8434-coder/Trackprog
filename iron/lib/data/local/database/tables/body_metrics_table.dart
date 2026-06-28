import 'package:drift/drift.dart';
import '../../../../domain/entities/body_metrics.dart';

@DataClassName('BodyWeightEntryModel')
class BodyWeightEntriesTable extends Table {
  TextColumn get id => text()();
  RealColumn get weightKg => real()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BodyMeasurementModel')
class BodyMeasurementsTable extends Table {
  TextColumn get id => text()();
  IntColumn get type => integer().map(const EnumIndexConverter<MeasurementType>(MeasurementType.values))();
  RealColumn get valueCm => real()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
