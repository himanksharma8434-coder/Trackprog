import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../domain/entities/workout.dart';
import '../../../../domain/usecases/workout_usecases.dart';
import 'active_workout_event.dart';
import 'active_workout_state.dart';

@injectable
class ActiveWorkoutBloc extends Bloc<ActiveWorkoutEvent, ActiveWorkoutState> {
  final StartWorkoutSessionUseCase startWorkoutSession;
  final CompleteWorkoutUseCase completeWorkout;
  
  Timer? _workoutTimer;
  Timer? _restTimer;
  DateTime? _startTime;
  DateTime? _restTargetTime;

  ActiveWorkoutBloc(this.startWorkoutSession, this.completeWorkout) : super(ActiveWorkoutInitial()) {
    on<StartWorkout>((event, emit) {
      _startTime = DateTime.now();
      
      final session = WorkoutSession(
        id: const Uuid().v4(),
        programSessionId: event.plannedDay?.id,
        name: event.plannedDay?.name ?? 'Freestyle Workout',
        startedAt: _startTime!,
        exerciseLogs: const [],
        totalVolumeKg: 0.0,
        durationSeconds: 0,
      );

      _workoutTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        add(TickWorkoutTimer(DateTime.now().difference(_startTime!)));
      });

      emit(ActiveWorkoutInProgress(session: session, elapsedTime: Duration.zero));
    });

    on<TickWorkoutTimer>((event, emit) {
      if (state is ActiveWorkoutInProgress) {
        final current = state as ActiveWorkoutInProgress;
        emit(ActiveWorkoutInProgress(
          session: current.session,
          elapsedTime: event.elapsed,
          restTimerRemaining: current.restTimerRemaining,
        ));
      }
    });

    on<TickRestTimer>((event, emit) {
      if (state is ActiveWorkoutInProgress) {
        final current = state as ActiveWorkoutInProgress;
        if (event.remaining.inSeconds <= 0) {
          _restTimer?.cancel();
          emit(ActiveWorkoutInProgress(
            session: current.session,
            elapsedTime: current.elapsedTime,
            restTimerRemaining: null,
          ));
        } else {
          emit(ActiveWorkoutInProgress(
            session: current.session,
            elapsedTime: current.elapsedTime,
            restTimerRemaining: event.remaining,
          ));
        }
      }
    });

    on<AddExerciseToWorkout>((event, emit) {
      if (state is ActiveWorkoutInProgress) {
        final current = state as ActiveWorkoutInProgress;
        final newExerciseLog = ExerciseLog(
          id: const Uuid().v4(),
          exerciseId: event.exerciseId,
          exerciseName: event.exerciseName,
          sets: const [],
          orderInSession: current.session.exerciseLogs.length,
        );
        final updatedSession = current.session.copyWith(
          exerciseLogs: [...current.session.exerciseLogs, newExerciseLog],
        );
        emit(ActiveWorkoutInProgress(
          session: updatedSession,
          elapsedTime: current.elapsedTime,
          restTimerRemaining: current.restTimerRemaining,
        ));
      }
    });

    on<LogSet>((event, emit) {
      if (state is ActiveWorkoutInProgress) {
        final current = state as ActiveWorkoutInProgress;
        
        final updatedExercises = current.session.exerciseLogs.map((e) {
          if (e.id == event.exerciseLogId) {
            return e.copyWith(sets: [...e.sets, event.setLog]);
          }
          return e;
        }).toList();

        final updatedSession = current.session.copyWith(exerciseLogs: updatedExercises);

        _restTimer?.cancel();
        int restSeconds = 90;
        _restTargetTime = DateTime.now().add(Duration(seconds: restSeconds));
        
        _restTimer = Timer.periodic(const Duration(seconds: 1), (_) {
          if (_restTargetTime != null) {
            final remaining = _restTargetTime!.difference(DateTime.now());
            add(TickRestTimer(remaining));
          }
        });

        emit(ActiveWorkoutInProgress(
          session: updatedSession,
          elapsedTime: current.elapsedTime,
          restTimerRemaining: Duration(seconds: restSeconds),
        ));
      }
    });

    on<FinishWorkout>((event, emit) async {
      if (state is ActiveWorkoutInProgress) {
        final current = state as ActiveWorkoutInProgress;
        _workoutTimer?.cancel();
        _restTimer?.cancel();
        
        final finishedSession = current.session.copyWith(
          finishedAt: DateTime.now(),
          durationSeconds: current.elapsedTime.inSeconds,
        );
        
        try {
          await completeWorkout(finishedSession);
          emit(ActiveWorkoutFinished());
        } catch (e) {
          emit(ActiveWorkoutError(e.toString()));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _workoutTimer?.cancel();
    _restTimer?.cancel();
    return super.close();
  }
}
