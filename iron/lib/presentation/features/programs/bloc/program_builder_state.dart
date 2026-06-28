import 'package:equatable/equatable.dart';
import '../../../../domain/entities/program.dart';

abstract class ProgramBuilderState extends Equatable {
  const ProgramBuilderState();
  @override
  List<Object?> get props => [];
}

class ProgramBuilderInitial extends ProgramBuilderState {}

class ProgramBuilderEditing extends ProgramBuilderState {
  final Program program;
  const ProgramBuilderEditing(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramBuilderSaved extends ProgramBuilderState {}

class ProgramBuilderError extends ProgramBuilderState {
  final String message;
  const ProgramBuilderError(this.message);

  @override
  List<Object?> get props => [message];
}
