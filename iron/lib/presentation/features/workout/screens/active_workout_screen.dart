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
import '../../../widgets/glass_widgets.dart';

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
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0D0D15), Color(0xFF050508)],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // ── Top bar ──
                    _buildTopBar(context, state),
                    // ── Rest timer banner ──
                    if (state.restTimerRemaining != null)
                      _buildRestBanner(state.restTimerRemaining!),
                    // ── Exercise list ──
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                        itemCount: state.session.exerciseLogs.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.session.exerciseLogs.length) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: GlassButton(
                                label: 'Add Exercise',
                                icon: Icons.add_rounded,
                                onPressed: () {
                                  context.read<ActiveWorkoutBloc>().add(
                                    const AddExerciseToWorkout('ex_1', 'Barbell Bench Press'),
                                  );
                                },
                              ),
                            );
                          }
                          final exerciseLog = state.session.exerciseLogs[index];
                          return _buildExerciseCard(context, exerciseLog);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTopBar(BuildContext context, ActiveWorkoutInProgress state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 12, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderGlass, width: 0.5),
              ),
              child: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary, size: 20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.session.name, style: AppTypography.h4),
                Text(
                  _formatDuration(state.elapsedTime),
                  style: AppTypography.numericData.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: AppColors.primaryGlow, blurRadius: 12, spreadRadius: -2),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => context.read<ActiveWorkoutBloc>().add(FinishWorkout()),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('Finish', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestBanner(Duration remaining) {
    final progress = remaining.inSeconds / 90; // normalize to 0..1
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDim, AppColors.primaryGlow.withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 0.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer_rounded, color: AppColors.primary, size: 24),
                const SizedBox(width: 12),
                Text('Rest', style: AppTypography.h4.copyWith(color: AppColors.primary)),
                const Spacer(),
                Text(
                  _formatDuration(remaining),
                  style: AppTypography.numericDataLarge.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, ExerciseLog exerciseLog) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(exerciseLog.exerciseName, style: AppTypography.h3.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 16),
          // Column headers
          Row(
            children: [
              Expanded(flex: 1, child: Text('SET', style: AppTypography.labelS)),
              Expanded(flex: 3, child: Text('KG', textAlign: TextAlign.center, style: AppTypography.labelS)),
              Expanded(flex: 3, child: Text('REPS', textAlign: TextAlign.center, style: AppTypography.labelS)),
              Expanded(flex: 2, child: Text('RIR', textAlign: TextAlign.center, style: AppTypography.labelS)),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
          const SizedBox(height: 8),
          Divider(color: AppColors.borderGlass, height: 1),
          const SizedBox(height: 8),
          ...exerciseLog.sets.asMap().entries.map((e) => _buildSetRow(e.key + 1, e.value)),
          _buildInputRow(context, exerciseLog.id, exerciseLog.sets.length + 1),
        ],
      ),
    );
  }

  Widget _buildSetRow(int index, SetLog setLog) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('$index', style: AppTypography.numericData.copyWith(color: AppColors.textMuted))),
          Expanded(flex: 3, child: Text('${setLog.weightKg}', textAlign: TextAlign.center, style: AppTypography.numericData)),
          Expanded(flex: 3, child: Text('${setLog.reps}', textAlign: TextAlign.center, style: AppTypography.numericData)),
          Expanded(flex: 2, child: Text('${setLog.rir ?? '-'}', textAlign: TextAlign.center, style: AppTypography.numericData)),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.successDim,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, color: AppColors.success, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(BuildContext context, String exerciseLogId, int index) {
    double weight = 0;
    int reps = 0;
    int? rir;

    InputDecoration _inputDecor() {
      return InputDecoration(
        filled: true,
        fillColor: AppColors.surfaceGlass,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderGlass, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.borderGlass, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('$index', style: AppTypography.numericData.copyWith(color: AppColors.textMuted))),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: AppTypography.numericData,
                decoration: _inputDecor(),
                onChanged: (v) => weight = double.tryParse(v) ?? 0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: AppTypography.numericData,
                decoration: _inputDecor(),
                onChanged: (v) => reps = int.tryParse(v) ?? 0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: AppTypography.numericData,
                decoration: _inputDecor(),
                onChanged: (v) => rir = int.tryParse(v),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (reps > 0) {
                  final setLog = SetLog(
                    id: const Uuid().v4(),
                    setNumber: index,
                    type: SetType.normal,
                    weightKg: weight,
                    reps: reps,
                    rir: rir,
                    loggedAt: DateTime.now(),
                  );
                  context.read<ActiveWorkoutBloc>().add(LogSet(exerciseLogId, setLog));
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: AppColors.primaryGlow, blurRadius: 8, spreadRadius: -2),
                  ],
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
