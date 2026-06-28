import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/di/injection.dart';
import '../bloc/active_workout_bloc.dart';
import '../bloc/active_workout_event.dart';
import '../bloc/active_workout_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/workout.dart';
import '../../../widgets/precision_widgets.dart';

class ActiveWorkoutScreen extends StatelessWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActiveWorkoutBloc>()..add(const StartWorkout()),
      child: const ActiveWorkoutView(),
    );
  }
}

class ActiveWorkoutView extends StatelessWidget {
  const ActiveWorkoutView({super.key});

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    final hours = d.inHours;
    if (hours > 0) {
      return '${twoDigits(hours)}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActiveWorkoutBloc, ActiveWorkoutState>(
      listener: (context, state) {
        if (state is ActiveWorkoutFinished) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state is ActiveWorkoutInitial) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
          );
        }

        if (state is ActiveWorkoutInProgress) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Column(
                children: [
                  // ── Top bar ──
                  _buildTopBar(context, state),
                  // ── Exercise list ──
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                      itemCount: state.session.exerciseLogs.length + 2, // +1 for add exercise, +1 for terminate
                      itemBuilder: (context, index) {
                        if (index == 0 && state.restTimerRemaining != null) {
                          return _buildRestBanner(state.restTimerRemaining!);
                        }
                        
                        final actualIndex = state.restTimerRemaining != null ? index - 1 : index;

                        if (actualIndex < 0) return const SizedBox.shrink();

                        if (actualIndex == state.session.exerciseLogs.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SecondaryButton(
                              label: 'Add Exercise',
                              icon: Icons.add,
                              onPressed: () {
                                _showAddExerciseDialog(context, context.read<ActiveWorkoutBloc>());
                              },
                            ),
                          );
                        }
                        if (actualIndex == state.session.exerciseLogs.length + 1) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 32, top: 16),
                            child: OutlinedButton.icon(
                              onPressed: () => context.read<ActiveWorkoutBloc>().add(FinishWorkout()),
                              icon: const Icon(Icons.stop_circle, color: AppColors.error),
                              label: Text('TERMINATE WORKOUT', style: AppTypography.labelCaps.copyWith(color: AppColors.error)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.error.withOpacity(0.5), width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: AppColors.surface,
                              ),
                            ),
                          );
                        }
                        final exerciseLog = state.session.exerciseLogs[actualIndex];
                        return _buildExerciseCard(context, exerciseLog);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTopBar(BuildContext context, ActiveWorkoutInProgress state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, color: AppColors.textPrimary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.session.name.toUpperCase(), style: AppTypography.h4),
                Text(
                  _formatDuration(state.elapsedTime),
                  style: AppTypography.numericData.copyWith(color: AppColors.primary, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestBanner(Duration remaining) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(_formatDuration(remaining), style: AppTypography.h1.copyWith(fontSize: 48, color: AppColors.textPrimary)),
          Text('REST TIMER', style: AppTypography.labelCaps.copyWith(color: AppColors.primary, letterSpacing: 2.0)),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, ExerciseLog exerciseLog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            border: Border.all(color: AppColors.border, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.fitness_center, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                'STRENGTH • ${exerciseLog.sets.length} SETS',
                style: AppTypography.labelCaps.copyWith(color: AppColors.textSecondary, fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(exerciseLog.exerciseName.toUpperCase(), style: AppTypography.h2),
        const SizedBox(height: 24),
        MetricCard(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WORKING SETS', style: AppTypography.labelCaps.copyWith(color: AppColors.textPrimary)),
                ],
              ),
              const SizedBox(height: 16),
              ...exerciseLog.sets.asMap().entries.map((e) => _buildSetRow(e.key + 1, e.value)),
              _buildInputRow(context, exerciseLog.id, exerciseLog.sets.length + 1),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSetRow(int index, SetLog setLog) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Text('$index', style: AppTypography.numericData.copyWith(color: AppColors.textMuted)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${setLog.weightKg} LBS', style: AppTypography.bodyM.copyWith(decoration: TextDecoration.lineThrough, color: AppColors.textSecondary)),
                Text('${setLog.reps} REPS', style: AppTypography.labelCaps.copyWith(color: AppColors.textMuted, fontSize: 10)),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: AppColors.primary, size: 20),
        ],
      ),
    );
  }

  Widget _buildInputRow(BuildContext context, String exerciseLogId, int index) {
    double weight = 0;
    int reps = 0;

    InputDecoration _inputDecor() {
      return InputDecoration(
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text('ACTIVE SET $index', style: AppTypography.labelCaps.copyWith(color: AppColors.primary)),
              const Spacer(),
              Text('CURRENT METRIC', style: AppTypography.labelCaps.copyWith(color: AppColors.textMuted, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WEIGHT (LBS)', style: AppTypography.labelCaps.copyWith(color: AppColors.textMuted, fontSize: 10)),
                    const SizedBox(height: 6),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: AppTypography.h3,
                      decoration: _inputDecor(),
                      onChanged: (v) => weight = double.tryParse(v) ?? 0,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('REPS', style: AppTypography.labelCaps.copyWith(color: AppColors.textMuted, fontSize: 10)),
                    const SizedBox(height: 6),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: AppTypography.h3,
                      decoration: _inputDecor(),
                      onChanged: (v) => reps = int.tryParse(v) ?? 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: 'Log Metric',
            onPressed: () {
              if (reps > 0) {
                final setLog = SetLog(
                  id: const Uuid().v4(),
                  setNumber: index,
                  type: SetType.normal,
                  weightKg: weight,
                  reps: reps,
                  rir: null,
                  loggedAt: DateTime.now(),
                );
                context.read<ActiveWorkoutBloc>().add(LogSet(exerciseLogId, setLog));
              }
            },
          ),
        ],
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context, ActiveWorkoutBloc bloc) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: const BorderSide(color: AppColors.border)),
          title: Text('Add Exercise', style: AppTypography.h3),
          content: TextField(
            controller: controller,
            style: AppTypography.bodyM,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'e.g. Bench Press',
              hintStyle: AppTypography.bodyM.copyWith(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: AppTypography.labelL.copyWith(color: AppColors.textMuted)),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  bloc.add(AddExerciseToWorkout(const Uuid().v4(), text));
                }
                Navigator.pop(context);
              },
              child: Text('Add', style: AppTypography.labelL.copyWith(color: AppColors.primary)),
            ),
          ],
        );
      },
    );
  }
}

