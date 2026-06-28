import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/di/injection.dart';
import '../../../widgets/precision_widgets.dart';
import '../../exercises/screens/exercise_library_screen.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()..add(LoadDashboard()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  void _showAddDayDialog(BuildContext context, DashboardBloc bloc) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text('Add Day', style: AppTypography.h3),
          content: TextField(
            controller: controller,
            style: AppTypography.bodyM,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'e.g. Leg Day',
              hintStyle: AppTypography.bodyM.copyWith(color: AppColors.textMuted),
              filled: true,
              fillColor: AppColors.background,
              border: const OutlineInputBorder(),
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
                  bloc.add(AddNewDay(text));
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

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Routines', style: AppTypography.h2),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: AppColors.textSecondary),
            onPressed: () => context.push('/history'),
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is DashboardLoaded) {
            final day = state.selectedDay;
            return Column(
              children: [
                // Top Bar (Days)
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.days.length + 1,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      if (index == state.days.length) {
                        return GestureDetector(
                          onTap: () => _showAddDayDialog(context, bloc),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: AppColors.border),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.add, color: AppColors.textSecondary, size: 20),
                          ),
                        );
                      }
                      final d = state.days[index];
                      final isSelected = d.id == state.selectedDayId;
                      return GestureDetector(
                        onTap: () => bloc.add(SelectDay(d.id)),
                        onLongPress: () => bloc.add(DeleteDay(d.id)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.surface,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : AppColors.border,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            d.name,
                            style: AppTypography.labelL.copyWith(
                              color: isSelected ? Colors.black : AppColors.textPrimary,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Content
                Expanded(
                  child: day.exercises.isEmpty
                      ? Center(
                          child: Text(
                            'No exercises planned.\nTap + to add some!',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyM.copyWith(color: AppColors.textMuted),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: day.exercises.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final exercise = day.exercises[index];
                            return MetricCard(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(exercise.name, style: AppTypography.bodyL),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close_rounded, color: AppColors.textMuted, size: 20),
                                    onPressed: () => bloc.add(RemoveExerciseFromDay(day.id, exercise)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                // Start Workout Button & Add Exercise
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Column(
                    children: [
                      SecondaryButton(
                        label: 'Add Exercise',
                        icon: Icons.add,
                        onPressed: () async {
                          final selected = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => const ExerciseLibraryScreen(isPicker: true)),
                          );
                          if (selected != null) {
                            bloc.add(AddExerciseToDay(day.id, selected));
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      PrimaryButton(
                        label: 'Start Workout',
                        onPressed: () {
                          // Pass exercises to active workout
                          context.push('/workout/active', extra: day.exercises);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
