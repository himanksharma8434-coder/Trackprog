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
  final String dayId;

  const SessionBuilderScreen({super.key, required this.dayId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramBuilderBloc, ProgramBuilderState>(
      builder: (context, state) {
        if (state is ProgramBuilderEditing) {
          final day = state.program.days.firstWhere((d) => d.id == dayId, orElse: () => state.program.days.first);

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              title: Text(day.name, style: AppTypography.h3),
              elevation: 0,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...day.exercises.map((e) => _buildProgramExerciseCard(context, day, e)),
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
                      final newExercise = ProgramExercise(
                        id: const Uuid().v4(),
                        exerciseId: selectedExercise.id,
                        exerciseName: selectedExercise.name,
                        sets: [
                          ProgramSet(id: const Uuid().v4(), setNumber: 1),
                        ],
                        restSeconds: 90,
                      );
                      context.read<ProgramBuilderBloc>().add(AddExerciseToDay(dayId, newExercise));
                    }
                  },
                ),
              ],
            ),
          );
        }
        return const Scaffold(body: Center(child: Text('Day not found')));
      },
    );
  }

  Widget _buildProgramExerciseCard(BuildContext context, ProgramDay day, ProgramExercise exercise) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exercise.exerciseName, style: AppTypography.h4),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: AppColors.textSecondary, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
            if (exercise.historicalHint != null) ...[
              Text(exercise.historicalHint!, style: AppTypography.bodyS.copyWith(color: AppColors.primary)),
              const SizedBox(height: 12),
            ] else ...[
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                SizedBox(width: 40, child: Text('SET', style: AppTypography.labelCaps.copyWith(color: AppColors.textSecondary))),
                Expanded(child: Text('TARGET REPS', style: AppTypography.labelCaps.copyWith(color: AppColors.textSecondary), textAlign: TextAlign.center)),
                Expanded(child: Text('TARGET WT', style: AppTypography.labelCaps.copyWith(color: AppColors.textSecondary), textAlign: TextAlign.center)),
              ],
            ),
            const SizedBox(height: 8),
            ...exercise.sets.map((s) => _buildSetRow(context, day, exercise, s)),
            const SizedBox(height: 12),
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add Set', style: TextStyle(fontSize: 12)),
                onPressed: () {
                  final newSet = ProgramSet(
                    id: const Uuid().v4(),
                    setNumber: exercise.sets.length + 1,
                    targetReps: exercise.sets.isNotEmpty ? exercise.sets.last.targetReps : null,
                    targetWeight: exercise.sets.isNotEmpty ? exercise.sets.last.targetWeight : null,
                  );
                  context.read<ProgramBuilderBloc>().add(AddSetToExercise(day.id, exercise.id, newSet));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetRow(BuildContext context, ProgramDay day, ProgramExercise exercise, ProgramSet pSet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(color: AppColors.surfaceElevated, borderRadius: BorderRadius.circular(4)),
              child: Text('${pSet.setNumber}', textAlign: TextAlign.center, style: AppTypography.numericData.copyWith(fontSize: 14)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildNumberInput(
              value: pSet.targetReps?.toString(),
              hint: '-',
              onChanged: (val) {
                final updated = pSet.copyWith(targetReps: int.tryParse(val));
                context.read<ProgramBuilderBloc>().add(UpdateSet(day.id, exercise.id, updated));
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildNumberInput(
              value: pSet.targetWeight?.toString(),
              hint: '-',
              onChanged: (val) {
                final updated = pSet.copyWith(targetWeight: double.tryParse(val));
                context.read<ProgramBuilderBloc>().add(UpdateSet(day.id, exercise.id, updated));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberInput({String? value, required String hint, required Function(String) onChanged}) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        initialValue: value,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: AppTypography.numericData.copyWith(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.textMuted),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
