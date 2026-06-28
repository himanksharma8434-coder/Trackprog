import 'package:injectable/injectable.dart';
import '../local/database/app_database.dart';
import '../local/database/daos/exercise_dao.dart';

@module
abstract class DatabaseModule {
  @singleton
  AppDatabase get db => AppDatabase();

  @lazySingleton
  ExerciseDao getExerciseDao(AppDatabase db) => ExerciseDao(db);
}
