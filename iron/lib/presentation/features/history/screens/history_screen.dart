import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/workout.dart';
import '../../../../core/di/injection.dart';
import '../../../../domain/repositories/workout_repository.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _workoutRepo = getIt<WorkoutRepository>();
  List<WorkoutSession> _sessions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final sessions = await _workoutRepo.getWorkoutHistory();
    if (mounted) {
      setState(() {
        _sessions = sessions;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('History', style: AppTypography.h2),
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.primary))
          : _sessions.isEmpty
              ? const Center(
                  child: Text(
                    'No workouts yet.\nTap below to start!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
                  itemCount: _sessions.length,
                  itemBuilder: (context, index) {
                    final session = _sessions[index];
                    return Card(
                      color: AppColors.surface,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  session.name,
                                  style: AppTypography.h4.copyWith(color: AppColors.textPrimary),
                                ),
                                Text(
                                  DateFormat('MMM d, yyyy').format(session.startedAt),
                                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${session.exerciseLogs.length} Exercises • ${(session.durationSeconds / 60).floor()} min • ${session.totalVolumeKg.toStringAsFixed(0)} kg',
                              style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await context.push('/workout/active');
          _loadHistory();
        },
        icon: const Icon(Icons.add, color: AppColors.background),
        label: const Text(
          'Start Workout',
          style: TextStyle(color: AppColors.background, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
