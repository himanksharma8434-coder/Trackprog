import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../widgets/precision_widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildGreetingAndCTA(context),
                  const SizedBox(height: 40),
                  _buildMetricsGrid(context),
                  const SizedBox(height: 40),
                  _buildRecentSessions(context),
                  const SizedBox(height: 32),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingAndCTA(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ready to crush it, Alex?', style: AppTypography.h1),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: AppTypography.bodyL.copyWith(color: AppColors.textSecondary),
            children: [
              const TextSpan(text: 'Today is '),
              TextSpan(text: 'Leg Day', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              const TextSpan(text: '. Let\'s build that foundation.'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Start Workout',
          icon: Icons.play_arrow,
          onPressed: () => context.push('/workout/active'),
          isExpanded: true,
        ),
      ],
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TODAY\'S PROGRESS', style: AppTypography.labelCaps),
            Text('Last sync: Just now', style: AppTypography.numericData.copyWith(color: AppColors.primary)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                title: 'CALORIES',
                icon: Icons.local_fire_department,
                value: '482',
                unit: 'kcal',
                progress: 0.6,
                progressText: '60% of 800 kcal goal',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildMetricCard(
                title: 'ACTIVE',
                icon: Icons.timer,
                value: '45',
                unit: 'm',
                progress: 0.75,
                progressText: '75% of 60m goal',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: MetricCard(
                padding: const EdgeInsets.all(12),
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('AVG HR', style: AppTypography.labelCaps),
                        const Icon(Icons.favorite, color: AppColors.primary, size: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('124', style: AppTypography.h1),
                        const SizedBox(width: 2),
                        Text('bpm', style: AppTypography.bodyS),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildSparkBar(0.4),
                        const SizedBox(width: 2),
                        _buildSparkBar(0.6),
                        const SizedBox(width: 2),
                        _buildSparkBar(0.8),
                        const SizedBox(width: 2),
                        _buildSparkBar(0.9, isPrimary: true),
                        const SizedBox(width: 2),
                        _buildSparkBar(0.7),
                        const SizedBox(width: 2),
                        _buildSparkBar(0.5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSparkBar(double heightFactor, {bool isPrimary = false}) {
    return Container(
      width: 4,
      height: 24 * heightFactor,
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required IconData icon,
    required String value,
    required String unit,
    required double progress,
    required String progressText,
  }) {
    return MetricCard(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTypography.labelCaps),
              Icon(icon, color: AppColors.primary, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTypography.h1),
              const SizedBox(width: 2),
              Text(unit, style: AppTypography.bodyS),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(progressText, style: AppTypography.numericData.copyWith(fontSize: 10, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildRecentSessions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RECENT SESSIONS', style: AppTypography.labelCaps),
        const SizedBox(height: 16),
        _buildSessionRow(
          title: 'Upper Body Power',
          subtitle: 'Yesterday • 55 mins',
          icon: Icons.fitness_center,
          tags: ['Strength', '12k Volume'],
          isActive: true,
        ),
        _buildSessionRow(
          title: 'Zone 2 Cardio',
          subtitle: 'Oct 24 • 45 mins',
          icon: Icons.directions_run,
          tags: ['Cardio', '4.2 mi'],
          isActive: false,
        ),
      ],
    );
  }

  Widget _buildSessionRow({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<String> tags,
    bool isActive = false,
  }) {
    return MetricCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      isActive: isActive,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: isActive ? AppColors.primary : AppColors.textSecondary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.h4),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTypography.numericData.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: tags.map((tag) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: DataChip(label: tag, isSelected: isActive && tag == tags.first),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

