import 'package:drift/drift.dart';
import '../../../../domain/entities/user_profile.dart';

@DataClassName('UserProfileModel')
class UserProfilesTable extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  IntColumn get goal => integer().map(const EnumIndexConverter<Goal>(Goal.values))();
  IntColumn get experience => integer().map(const EnumIndexConverter<ExperienceLevel>(ExperienceLevel.values))();
  IntColumn get trainingDaysPerWeek => integer()();
  IntColumn get sessionDurationMinutes => integer()();
  IntColumn get unit => integer().map(const EnumIndexConverter<WeightUnit>(WeightUnit.values))();
  TextColumn get activeGymProfileId => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
