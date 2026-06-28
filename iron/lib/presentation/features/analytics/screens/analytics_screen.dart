import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection.dart';
import '../bloc/analytics_bloc.dart';
import '../bloc/analytics_event.dart';
import '../bloc/analytics_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/workout.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnalyticsBloc>()..add(LoadAnalytics()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text('Analytics', style: AppTypography.h3),
          elevation: 0,
        ),
        body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
          builder: (context, state) {
            if (state is AnalyticsLoading || state is AnalyticsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AnalyticsError) {
              return Center(child: Text(state.message, style: AppTypography.bodyM.copyWith(color: AppColors.error)));
            }
            if (state is AnalyticsLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Volume Over Time', style: AppTypography.h4),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: _buildVolumeChart(state.history),
                  ),
                  const SizedBox(height: 32),
                  Text('Workout History', style: AppTypography.h4),
                  const SizedBox(height: 16),
                  ...state.history.map((session) => _buildHistoryCard(session)),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildVolumeChart(List<WorkoutSession> history) {
    if (history.isEmpty) {
      return Center(child: Text('No data available', style: AppTypography.bodyM));
    }
    
    final sortedHistory = List<WorkoutSession>.from(history)
      ..sort((a, b) => a.startedAt.compareTo(b.startedAt));
      
    final spots = sortedHistory.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.totalVolumeKg);
    }).toList();

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < sortedHistory.length) {
                  final date = sortedHistory[value.toInt()].startedAt;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(DateFormat('MM/dd').format(date), style: AppTypography.bodyS),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}', style: AppTypography.bodyS);
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.primary,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.primary.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(WorkoutSession session) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(session.name, style: AppTypography.h4),
                Text(DateFormat('MMM d, y').format(session.startedAt), style: AppTypography.bodyS.copyWith(color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 8),
            Text('${session.exerciseLogs.length} Exercises • ${session.totalVolumeKg} kg Volume', style: AppTypography.bodyM),
          ],
        ),
      ),
    );
  }
}
