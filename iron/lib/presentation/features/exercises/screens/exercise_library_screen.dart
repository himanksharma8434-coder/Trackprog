import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/exercise_bloc.dart';
import '../bloc/exercise_event.dart';
import '../bloc/exercise_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/exercise.dart';
import '../../../widgets/glass_widgets.dart';

class ExerciseLibraryScreen extends StatelessWidget {
  final bool isPicker;

  const ExerciseLibraryScreen({super.key, this.isPicker = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExerciseBloc>()..add(LoadExercises()),
      child: Scaffold(
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
                // ── Header ──
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      if (isPicker)
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceGlass,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.borderGlass, width: 0.5),
                            ),
                            child: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary, size: 20),
                          ),
                        ),
                      Text(
                        isPicker ? 'Pick Exercise' : 'Exercises',
                        style: AppTypography.h2,
                      ),
                    ],
                  ),
                ),
                // ── Search bar ──
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Builder(
                    builder: (context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: TextField(
                            style: AppTypography.bodyL,
                            decoration: InputDecoration(
                              hintText: 'Search exercises...',
                              hintStyle: AppTypography.bodyM.copyWith(color: AppColors.textMuted),
                              prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                              filled: true,
                              fillColor: AppColors.surfaceGlass,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(color: AppColors.borderGlass, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(color: AppColors.borderGlass, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(color: AppColors.primary, width: 1),
                              ),
                            ),
                            onChanged: (value) {
                              context.read<ExerciseBloc>().add(SearchExercises(value));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // ── List ──
                Expanded(
                  child: BlocBuilder<ExerciseBloc, ExerciseState>(
                    builder: (context, state) {
                      if (state is ExerciseLoading) {
                        return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                      } else if (state is ExerciseLoaded) {
                        if (state.exercises.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.search_off_rounded, color: AppColors.textMuted, size: 48),
                                const SizedBox(height: 16),
                                Text('No exercises found', style: AppTypography.bodyM.copyWith(color: AppColors.textMuted)),
                              ],
                            ),
                          );
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                          itemCount: state.exercises.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final exercise = state.exercises[index];
                            return GlassCard(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              onTap: () {
                                if (isPicker) {
                                  Navigator.pop(context, exercise);
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryDim,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.fitness_center_rounded, color: AppColors.primary, size: 18),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(exercise.name, style: AppTypography.bodyL),
                                  ),
                                  if (isPicker)
                                    const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary, size: 22),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state is ExerciseError) {
                        return Center(child: Text('Error: ${state.message}', style: AppTypography.bodyM.copyWith(color: AppColors.error)));
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
