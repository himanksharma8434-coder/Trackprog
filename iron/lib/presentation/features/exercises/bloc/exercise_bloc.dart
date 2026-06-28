import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/exercise_usecases.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetExercisesUseCase getExercises;
  final SearchExercisesUseCase searchExercises;

  ExerciseBloc(this.getExercises, this.searchExercises) : super(ExerciseInitial()) {
    on<LoadExercises>((event, emit) async {
      emit(ExerciseLoading());
      try {
        final exercises = await getExercises();
        emit(ExerciseLoaded(exercises));
      } catch (e) {
        emit(ExerciseError(e.toString()));
      }
    });

    on<SearchExercises>((event, emit) async {
      emit(ExerciseLoading());
      try {
        if (event.query.isEmpty) {
          final exercises = await getExercises();
          emit(ExerciseLoaded(exercises));
        } else {
          final exercises = await searchExercises(event.query);
          emit(ExerciseLoaded(exercises));
        }
      } catch (e) {
        emit(ExerciseError(e.toString()));
      }
    });
  }
}
