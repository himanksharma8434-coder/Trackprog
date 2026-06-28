import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/usecases/program_usecases.dart';
import '../../../../domain/repositories/workout_repository.dart';
import 'program_builder_event.dart';
import 'program_builder_state.dart';

@injectable
class ProgramBuilderBloc extends Bloc<ProgramBuilderEvent, ProgramBuilderState> {
  final BuildCustomProgramUseCase buildCustomProgram;
  final WorkoutRepository workoutRepository;

  ProgramBuilderBloc(this.buildCustomProgram, this.workoutRepository) : super(ProgramBuilderInitial()) {
    on<StartProgramBuilder>((event, emit) {
      final newProgram = Program(
        id: const Uuid().v4(),
        name: 'New Routine',
        days: [],
        isCustom: true,
        isImported: false,
        createdAt: DateTime.now(),
      );
      emit(ProgramBuilderEditing(newProgram));
    });

    on<UpdateProgramDetails>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        emit(ProgramBuilderEditing(
          current.copyWith(name: event.name),
        ));
      }
    });

    on<AddDay>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final newDay = ProgramDay(
          id: const Uuid().v4(),
          dayNumber: current.days.length + 1,
          name: event.name,
          exercises: [],
        );
        emit(ProgramBuilderEditing(
          current.copyWith(days: [...current.days, newDay]),
        ));
      }
    });

    on<AddExerciseToDay>((event, emit) async {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        
        String? historicalHint;
        try {
          final lastLog = await workoutRepository.getLastExerciseLog(event.exercise.exerciseId);
          if (lastLog != null && lastLog.sets.isNotEmpty) {
            final topSet = lastLog.sets.reduce((a, b) => a.weightKg > b.weightKg ? a : b);
            historicalHint = 'Previous: ${topSet.weightKg}kg x ${topSet.reps}';
            final est1Rm = topSet.weightKg * (1 + topSet.reps / 30.0);
            historicalHint += ' (Est. 1RM: ${est1Rm.toStringAsFixed(1)}kg)';
          }
        } catch (_) {}

        final exerciseWithHint = event.exercise.copyWith(historicalHint: historicalHint);

        final updatedDays = current.days.map((d) {
          if (d.id == event.dayId) {
            return d.copyWith(exercises: [...d.exercises, exerciseWithHint]);
          }
          return d;
        }).toList();
        emit(ProgramBuilderEditing(current.copyWith(days: updatedDays)));
      }
    });

    on<AddSetToExercise>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final updatedDays = current.days.map((d) {
          if (d.id == event.dayId) {
            final updatedExercises = d.exercises.map((e) {
              if (e.id == event.exerciseId) {
                return e.copyWith(sets: [...e.sets, event.programSet]);
              }
              return e;
            }).toList();
            return d.copyWith(exercises: updatedExercises);
          }
          return d;
        }).toList();
        emit(ProgramBuilderEditing(current.copyWith(days: updatedDays)));
      }
    });

    on<UpdateSet>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final updatedDays = current.days.map((d) {
          if (d.id == event.dayId) {
            final updatedExercises = d.exercises.map((e) {
              if (e.id == event.exerciseId) {
                final updatedSets = e.sets.map((s) {
                  if (s.id == event.updatedSet.id) return event.updatedSet;
                  return s;
                }).toList();
                return e.copyWith(sets: updatedSets);
              }
              return e;
            }).toList();
            return d.copyWith(exercises: updatedExercises);
          }
          return d;
        }).toList();
        emit(ProgramBuilderEditing(current.copyWith(days: updatedDays)));
      }
    });

    on<SaveProgram>((event, emit) async {
      if (state is ProgramBuilderEditing) {
        final program = (state as ProgramBuilderEditing).program;
        try {
          await buildCustomProgram(program);
          emit(ProgramBuilderSaved());
        } catch (e) {
          emit(ProgramBuilderError(e.toString()));
          // Re-emit editing state so they don't lose work
          emit(ProgramBuilderEditing(program));
        }
      }
    });
  }
}
