import 'package:equatable/equatable.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/workout.dart';

abstract class ProgramBuilderEvent extends Equatable {
  const ProgramBuilderEvent();
  @override
  List<Object?> get props => [];
}

class StartProgramBuilder extends ProgramBuilderEvent {}

class UpdateProgramDetails extends ProgramBuilderEvent {
  final String name;
  final int weeks;
  const UpdateProgramDetails(this.name, this.weeks);

  @override
  List<Object?> get props => [name, weeks];
}

class AddBlock extends ProgramBuilderEvent {
  final String name;
  final BlockType type;
  final int weeks;
  const AddBlock(this.name, this.type, this.weeks);

  @override
  List<Object?> get props => [name, type, weeks];
}

class AddSessionToBlock extends ProgramBuilderEvent {
  final String blockId;
  final String name;
  final int dayOfWeek;
  const AddSessionToBlock(this.blockId, this.name, this.dayOfWeek);

  @override
  List<Object?> get props => [blockId, name, dayOfWeek];
}

class AddExerciseToSession extends ProgramBuilderEvent {
  final String sessionId;
  final ProgramExercise exercise;
  const AddExerciseToSession(this.sessionId, this.exercise);

  @override
  List<Object?> get props => [sessionId, exercise];
}

class SaveProgram extends ProgramBuilderEvent {}
