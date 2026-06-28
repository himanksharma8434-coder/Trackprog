// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/di/database_module.dart' as _i883;
import '../../data/local/database/app_database.dart' as _i549;
import '../../data/local/database/daos/exercise_dao.dart' as _i823;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../data/repositories/body_metrics_repository_impl.dart' as _i258;
import '../../data/repositories/exercise_repository_impl.dart' as _i715;
import '../../data/repositories/gym_profile_repository_impl.dart' as _i92;
import '../../data/repositories/program_repository_impl.dart' as _i537;
import '../../data/repositories/workout_repository_impl.dart' as _i325;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/repositories/body_metrics_repository.dart' as _i602;
import '../../domain/repositories/exercise_repository.dart' as _i299;
import '../../domain/repositories/gym_profile_repository.dart' as _i582;
import '../../domain/repositories/program_repository.dart' as _i317;
import '../../domain/repositories/workout_repository.dart' as _i730;
import '../../domain/usecases/exercise_usecases.dart' as _i913;
import '../../domain/usecases/program_usecases.dart' as _i635;
import '../../domain/usecases/workout_usecases.dart' as _i89;
import '../../presentation/features/analytics/bloc/analytics_bloc.dart'
    as _i785;
import '../../presentation/features/body_metrics/bloc/body_metrics_bloc.dart'
    as _i925;
import '../../presentation/features/exercises/bloc/exercise_bloc.dart' as _i952;
import '../../presentation/features/onboarding/bloc/onboarding_bloc.dart'
    as _i244;
import '../../presentation/features/programs/bloc/program_builder_bloc.dart'
    as _i492;
import '../../presentation/features/workout/bloc/active_workout_bloc.dart'
    as _i599;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    gh.factory<_i925.BodyMetricsBloc>(() => _i925.BodyMetricsBloc());
    gh.singleton<_i549.AppDatabase>(() => databaseModule.db);
    gh.lazySingleton<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl());
    gh.lazySingleton<_i730.WorkoutRepository>(
      () => _i325.WorkoutRepositoryImpl(),
    );
    gh.lazySingleton<_i582.GymProfileRepository>(
      () => _i92.GymProfileRepositoryImpl(),
    );
    gh.lazySingleton<_i317.ProgramRepository>(
      () => _i537.ProgramRepositoryImpl(),
    );
    gh.factory<_i89.StartWorkoutSessionUseCase>(
      () => _i89.StartWorkoutSessionUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.factory<_i89.CompleteWorkoutUseCase>(
      () => _i89.CompleteWorkoutUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.factory<_i89.GetWorkoutHistoryUseCase>(
      () => _i89.GetWorkoutHistoryUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.lazySingleton<_i602.BodyMetricsRepository>(
      () => _i258.BodyMetricsRepositoryImpl(),
    );
    gh.lazySingleton<_i823.ExerciseDao>(
      () => databaseModule.getExerciseDao(gh<_i549.AppDatabase>()),
    );
    gh.factory<_i635.GetActiveProgramUseCase>(
      () => _i635.GetActiveProgramUseCase(gh<_i317.ProgramRepository>()),
    );
    gh.factory<_i635.BuildCustomProgramUseCase>(
      () => _i635.BuildCustomProgramUseCase(gh<_i317.ProgramRepository>()),
    );
    gh.lazySingleton<_i299.ExerciseRepository>(
      () => _i715.ExerciseRepositoryImpl(gh<_i823.ExerciseDao>()),
    );
    gh.factory<_i244.OnboardingBloc>(
      () => _i244.OnboardingBloc(gh<_i1073.AuthRepository>()),
    );
    gh.factory<_i913.GetExercisesUseCase>(
      () => _i913.GetExercisesUseCase(gh<_i299.ExerciseRepository>()),
    );
    gh.factory<_i913.SearchExercisesUseCase>(
      () => _i913.SearchExercisesUseCase(gh<_i299.ExerciseRepository>()),
    );
    gh.factory<_i913.CreateCustomExerciseUseCase>(
      () => _i913.CreateCustomExerciseUseCase(gh<_i299.ExerciseRepository>()),
    );
    gh.factory<_i599.ActiveWorkoutBloc>(
      () => _i599.ActiveWorkoutBloc(
        gh<_i89.StartWorkoutSessionUseCase>(),
        gh<_i89.CompleteWorkoutUseCase>(),
      ),
    );
    gh.factory<_i785.AnalyticsBloc>(
      () => _i785.AnalyticsBloc(gh<_i89.GetWorkoutHistoryUseCase>()),
    );
    gh.factory<_i492.ProgramBuilderBloc>(
      () => _i492.ProgramBuilderBloc(gh<_i635.BuildCustomProgramUseCase>()),
    );
    gh.factory<_i952.ExerciseBloc>(
      () => _i952.ExerciseBloc(
        gh<_i913.GetExercisesUseCase>(),
        gh<_i913.SearchExercisesUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i883.DatabaseModule {}
