import 'package:equatable/equatable.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/workout.dart';

abstract class ActiveWorkoutEvent extends Equatable {
  const ActiveWorkoutEvent();
  @override
  List<Object?> get props => [];
}

class StartWorkout extends ActiveWorkoutEvent {
  final ProgramSession? plannedSession;
  const StartWorkout({this.plannedSession});
  @override
  List<Object?> get props => [plannedSession];
}

class TickWorkoutTimer extends ActiveWorkoutEvent {
  final Duration elapsed;
  const TickWorkoutTimer(this.elapsed);
  @override
  List<Object?> get props => [elapsed];
}

class TickRestTimer extends ActiveWorkoutEvent {
  final Duration remaining;
  const TickRestTimer(this.remaining);
  @override
  List<Object?> get props => [remaining];
}

class LogSet extends ActiveWorkoutEvent {
  final String exerciseLogId;
  final SetLog setLog;
  const LogSet(this.exerciseLogId, this.setLog);
  @override
  List<Object?> get props => [exerciseLogId, setLog];
}

class AddExerciseToWorkout extends ActiveWorkoutEvent {
  final String exerciseId;
  final String exerciseName;
  const AddExerciseToWorkout(this.exerciseId, this.exerciseName);
  @override
  List<Object?> get props => [exerciseId, exerciseName];
}

class FinishWorkout extends ActiveWorkoutEvent {}
