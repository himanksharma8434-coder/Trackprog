import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/exercises_table.dart';
import 'tables/workouts_table.dart';
import 'tables/programs_table.dart';
import 'tables/body_metrics_table.dart';
import 'tables/gym_profiles_table.dart';
import 'tables/user_profile_table.dart';
import '../../../../domain/entities/workout.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/user_profile.dart';
import '../../../../domain/entities/body_metrics.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ExercisesTable,
    WorkoutSessionsTable,
    ExerciseLogsTable,
    SetLogsTable,
    ProgramsTable,
    ProgramDaysTable,
    ProgramExercisesTable,
    ProgramSetsTable,
    BodyWeightEntriesTable,
    BodyMeasurementsTable,
    GymProfilesTable,
    UserProfilesTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'iron_db'));

  @override
  int get schemaVersion => 1;
}
