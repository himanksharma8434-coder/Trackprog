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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/local/storage/local_storage_service.dart' as _i1012;
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
import '../../presentation/features/exercises/bloc/exercise_bloc.dart' as _i952;
import '../../presentation/features/workout/bloc/active_workout_bloc.dart'
    as _i599;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl());
    gh.lazySingleton<_i582.GymProfileRepository>(
      () => _i92.GymProfileRepositoryImpl(),
    );
    gh.lazySingleton<_i602.BodyMetricsRepository>(
      () => _i258.BodyMetricsRepositoryImpl(),
    );
    gh.lazySingleton<_i1012.LocalStorageService>(
      () => _i1012.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i317.ProgramRepository>(
      () => _i537.ProgramRepositoryImpl(gh<InvalidType>()),
    );
    gh.factory<_i635.GetActiveProgramUseCase>(
      () => _i635.GetActiveProgramUseCase(gh<_i317.ProgramRepository>()),
    );
    gh.factory<_i635.BuildCustomProgramUseCase>(
      () => _i635.BuildCustomProgramUseCase(gh<_i317.ProgramRepository>()),
    );
    gh.lazySingleton<_i299.ExerciseRepository>(
      () => _i715.ExerciseRepositoryImpl(gh<_i1012.LocalStorageService>()),
    );
    gh.lazySingleton<_i730.WorkoutRepository>(
      () => _i325.WorkoutRepositoryImpl(gh<_i1012.LocalStorageService>()),
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
    gh.factory<_i89.StartWorkoutSessionUseCase>(
      () => _i89.StartWorkoutSessionUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.factory<_i89.CompleteWorkoutUseCase>(
      () => _i89.CompleteWorkoutUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.factory<_i89.GetWorkoutHistoryUseCase>(
      () => _i89.GetWorkoutHistoryUseCase(gh<_i730.WorkoutRepository>()),
    );
    gh.factory<_i952.ExerciseBloc>(
      () => _i952.ExerciseBloc(
        gh<_i913.GetExercisesUseCase>(),
        gh<_i913.SearchExercisesUseCase>(),
      ),
    );
    gh.factory<_i599.ActiveWorkoutBloc>(
      () => _i599.ActiveWorkoutBloc(
        gh<_i89.StartWorkoutSessionUseCase>(),
        gh<_i89.CompleteWorkoutUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
