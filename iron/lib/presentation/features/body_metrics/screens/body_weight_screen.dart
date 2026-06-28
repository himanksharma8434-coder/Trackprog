import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/injection.dart';
import '../bloc/body_metrics_bloc.dart';
import '../bloc/body_metrics_event.dart';
import '../bloc/body_metrics_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/body_metrics.dart';

class BodyWeightScreen extends StatelessWidget {
  const BodyWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BodyMetricsBloc>()..add(LoadBodyMetrics()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text('Body Weight', style: AppTypography.h3),
          elevation: 0,
        ),
        body: BlocBuilder<BodyMetricsBloc, BodyMetricsState>(
          builder: (context, state) {
            if (state is BodyMetricsLoading || state is BodyMetricsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BodyMetricsError) {
              return Center(child: Text(state.message, style: AppTypography.bodyM.copyWith(color: AppColors.error)));
            }
            if (state is BodyMetricsLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Trend', style: AppTypography.h4),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: _buildTrendChart(state.history),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Log Weight'),
                    onPressed: () => _showLogWeightDialog(context),
                  ),
                  const SizedBox(height: 32),
                  Text('History', style: AppTypography.h4),
                  const SizedBox(height: 16),
                  ...state.history.map((entry) => _buildHistoryTile(entry)),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildTrendChart(List<BodyWeightEntry> history) {
    if (history.isEmpty) {
      return Center(child: Text('No data available', style: AppTypography.bodyM));
    }
    
    final sortedHistory = List<BodyWeightEntry>.from(history)
      ..sort((a, b) => a.date.compareTo(b.date));
      
    final spots = sortedHistory.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.weightKg);
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
                  final date = sortedHistory[value.toInt()].date;
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

  Widget _buildHistoryTile(BodyWeightEntry entry) {
    return ListTile(
      title: Text('${entry.weightKg} kg', style: AppTypography.bodyL),
      subtitle: Text(DateFormat('MMM d, y @ h:mm a').format(entry.date), style: AppTypography.bodyS),
    );
  }
  
  void _showLogWeightDialog(BuildContext context) {
    final bloc = context.read<BodyMetricsBloc>();
    showDialog(
      context: context,
      builder: (ctx) {
        String weight = '';
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text('Log Weight', style: AppTypography.h3),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Weight (kg)'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (v) => weight = v,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final w = double.tryParse(weight);
                if (w != null && w > 0) {
                  bloc.add(LogBodyWeight(w));
                  Navigator.pop(ctx);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
