import 'package:equatable/equatable.dart';
import '../../../../domain/entities/workout_day.dart';
import '../../../../domain/entities/exercise.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

class LoadDashboard extends DashboardEvent {}

class SelectDay extends DashboardEvent {
  final String dayId;
  const SelectDay(this.dayId);
  @override
  List<Object?> get props => [dayId];
}

class AddNewDay extends DashboardEvent {
  final String name;
  const AddNewDay(this.name);
  @override
  List<Object?> get props => [name];
}

class DeleteDay extends DashboardEvent {
  final String dayId;
  const DeleteDay(this.dayId);
  @override
  List<Object?> get props => [dayId];
}

class AddExerciseToDay extends DashboardEvent {
  final String dayId;
  final Exercise exercise;
  const AddExerciseToDay(this.dayId, this.exercise);
  @override
  List<Object?> get props => [dayId, exercise];
}

class RemoveExerciseFromDay extends DashboardEvent {
  final String dayId;
  final Exercise exercise;
  const RemoveExerciseFromDay(this.dayId, this.exercise);
  @override
  List<Object?> get props => [dayId, exercise];
}
