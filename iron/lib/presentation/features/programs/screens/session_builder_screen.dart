import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../bloc/program_builder_bloc.dart';
import '../bloc/program_builder_event.dart';
import '../bloc/program_builder_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/program.dart';
import '../../../../domain/entities/exercise.dart';
import '../../exercises/screens/exercise_library_screen.dart';

class SessionBuilderScreen extends StatelessWidget {
  final String blockId;
  final String sessionId;

  const SessionBuilderScreen({super.key, required this.blockId, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramBuilderBloc, ProgramBuilderState>(
      builder: (context, state) {
        if (state is ProgramBuilderEditing) {
          final block = state.program.blocks.firstWhere((b) => b.id == blockId);
          final session = block.sessions.firstWhere((s) => s.id == sessionId);

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              title: Text(session.name, style: AppTypography.h3),
              elevation: 0,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...session.exercises.map((e) => _buildProgramExerciseCard(context, e)),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Exercise'),
                  onPressed: () async {
                    final selectedExercise = await Navigator.push<Exercise?>(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const ExerciseLibraryScreen(isPicker: true),
                      ),
                    );

                    if (selectedExercise != null) {
                      _showExerciseConfigDialog(context, selectedExercise);
                    }
                  },
                ),
              ],
            ),
          );
        }
        return const Scaffold(body: Center(child: Text('Session not found')));
      },
    );
  }

  Widget _buildProgramExerciseCard(BuildContext context, ProgramExercise exercise) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(exercise.exerciseName, style: AppTypography.h4),
        subtitle: Text(
          '${exercise.sets} sets • ${exercise.repMin}-${exercise.repMax} reps • RIR ${exercise.rirTarget ?? "-"} • Rest ${exercise.restSeconds}s',
          style: AppTypography.bodyS.copyWith(color: AppColors.textSecondary),
        ),
      ),
    );
  }

  void _showExerciseConfigDialog(BuildContext context, Exercise exercise) {
    final bloc = context.read<ProgramBuilderBloc>();
    
    int sets = 3;
    int repMin = 8;
    int repMax = 12;
    int? rir = 2;
    int rest = 90;

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text('Configure ${exercise.name}', style: AppTypography.h3),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Sets'),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => sets = int.tryParse(v) ?? 3,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'Min Reps'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => repMin = int.tryParse(v) ?? 8,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(labelText: 'Max Reps'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => repMax = int.tryParse(v) ?? 12,
                      ),
                    ),
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Target RIR'),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => rir = int.tryParse(v),
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Rest (seconds)'),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => rest = int.tryParse(v) ?? 90,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                final progExercise = ProgramExercise(
                  id: const Uuid().v4(),
                  exerciseId: exercise.id,
                  exerciseName: exercise.name,
                  sets: sets,
                  repMin: repMin,
                  repMax: repMax,
                  rirTarget: rir,
                  restSeconds: rest,
                );
                bloc.add(AddExerciseToSession(sessionId, progExercise));
                Navigator.pop(ctx);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
