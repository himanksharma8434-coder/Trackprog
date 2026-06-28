import 'package:equatable/equatable.dart';
import '../../../../domain/entities/program.dart';

abstract class ProgramBuilderEvent extends Equatable {
  const ProgramBuilderEvent();
  @override
  List<Object?> get props => [];
}

class StartProgramBuilder extends ProgramBuilderEvent {}

class UpdateProgramDetails extends ProgramBuilderEvent {
  final String name;
  const UpdateProgramDetails(this.name);

  @override
  List<Object?> get props => [name];
}

class AddDay extends ProgramBuilderEvent {
  final String name;
  const AddDay(this.name);

  @override
  List<Object?> get props => [name];
}

class AddExerciseToDay extends ProgramBuilderEvent {
  final String dayId;
  final ProgramExercise exercise;
  const AddExerciseToDay(this.dayId, this.exercise);

  @override
  List<Object?> get props => [dayId, exercise];
}

class AddSetToExercise extends ProgramBuilderEvent {
  final String dayId;
  final String exerciseId;
  final ProgramSet programSet;
  const AddSetToExercise(this.dayId, this.exerciseId, this.programSet);

  @override
  List<Object?> get props => [dayId, exerciseId, programSet];
}

class UpdateSet extends ProgramBuilderEvent {
  final String dayId;
  final String exerciseId;
  final ProgramSet updatedSet;
  const UpdateSet(this.dayId, this.exerciseId, this.updatedSet);

  @override
  List<Object?> get props => [dayId, exerciseId, updatedSet];
}

class SaveProgram extends ProgramBuilderEvent {}
