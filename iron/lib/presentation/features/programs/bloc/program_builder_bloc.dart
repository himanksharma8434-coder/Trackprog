import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/usecases/program_usecases.dart';
import 'program_builder_event.dart';
import 'program_builder_state.dart';

@injectable
class ProgramBuilderBloc extends Bloc<ProgramBuilderEvent, ProgramBuilderState> {
  final BuildCustomProgramUseCase buildCustomProgram;

  ProgramBuilderBloc(this.buildCustomProgram) : super(ProgramBuilderInitial()) {
    on<StartProgramBuilder>((event, emit) {
      final newProgram = Program(
        id: const Uuid().v4(),
        name: 'New Program',
        totalWeeks: 4,
        isCustom: true,
        isImported: false,
        blocks: [],
        createdAt: DateTime.now(),
      );
      emit(ProgramBuilderEditing(newProgram));
    });

    on<UpdateProgramDetails>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        emit(ProgramBuilderEditing(
          current.copyWith(name: event.name, totalWeeks: event.weeks),
        ));
      }
    });

    on<AddBlock>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final newBlock = ProgramBlock(
          id: const Uuid().v4(),
          name: event.name,
          weeks: event.weeks,
          type: event.type,
          sessions: [],
        );
        emit(ProgramBuilderEditing(
          current.copyWith(blocks: [...current.blocks, newBlock]),
        ));
      }
    });

    on<AddSessionToBlock>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final updatedBlocks = current.blocks.map((b) {
          if (b.id == event.blockId) {
            final newSession = ProgramSession(
              id: const Uuid().v4(),
              dayOfWeek: event.dayOfWeek,
              name: event.name,
              exercises: [],
              estimatedDurationMinutes: 60,
            );
            return b.copyWith(sessions: [...b.sessions, newSession]);
          }
          return b;
        }).toList();
        emit(ProgramBuilderEditing(current.copyWith(blocks: updatedBlocks)));
      }
    });

    on<AddExerciseToSession>((event, emit) {
      if (state is ProgramBuilderEditing) {
        final current = (state as ProgramBuilderEditing).program;
        final updatedBlocks = current.blocks.map((b) {
          final updatedSessions = b.sessions.map((s) {
            if (s.id == event.sessionId) {
              return s.copyWith(exercises: [...s.exercises, event.exercise]);
            }
            return s;
          }).toList();
          return b.copyWith(sessions: updatedSessions);
        }).toList();
        emit(ProgramBuilderEditing(current.copyWith(blocks: updatedBlocks)));
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
