import 'package:equatable/equatable.dart';
import '../../../../domain/entities/workout.dart';

abstract class ActiveWorkoutState extends Equatable {
  const ActiveWorkoutState();
  @override
  List<Object?> get props => [];
}

class ActiveWorkoutInitial extends ActiveWorkoutState {}

class ActiveWorkoutInProgress extends ActiveWorkoutState {
  final WorkoutSession session;
  final Duration elapsedTime;
  final Duration? restTimerRemaining;

  const ActiveWorkoutInProgress({
    required this.session,
    required this.elapsedTime,
    this.restTimerRemaining,
  });

  @override
  List<Object?> get props => [session, elapsedTime, restTimerRemaining];
}

class ActiveWorkoutFinished extends ActiveWorkoutState {}

class ActiveWorkoutError extends ActiveWorkoutState {
  final String message;
  const ActiveWorkoutError(this.message);
  @override
  List<Object?> get props => [message];
}
