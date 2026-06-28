import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../widgets/glass_widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0D0D15), Color(0xFF050508)],
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context)),
            SliverToBoxAdapter(child: _buildQuickStartCard(context)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                child: Text('YOUR STATS', style: AppTypography.labelS.copyWith(letterSpacing: 2.0)),
              ),
            ),
            SliverToBoxAdapter(child: _buildStatCards(context)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                child: Text('QUICK ACTIONS', style: AppTypography.labelS.copyWith(letterSpacing: 2.0)),
              ),
            ),
            SliverToBoxAdapter(child: _buildQuickActions(context)),
            const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              Text('Athlete', style: AppTypography.h1),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(color: AppColors.primaryGlow, blurRadius: 12, spreadRadius: -2),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.person_rounded, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStartCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GlassCard(
        padding: const EdgeInsets.all(24),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDim,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.bolt_rounded, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next Session', style: AppTypography.h4),
                    Text('Hypertrophy Block · Week 2 Day 1', style: AppTypography.bodyS),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            GlowButton(
              label: 'Start Workout',
              icon: Icons.play_arrow_rounded,
              onPressed: () => context.push('/workout/active'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GlassCard(
              margin: EdgeInsets.zero,
              onTap: () => context.push('/body-weight'),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                    child: const Icon(Icons.monitor_weight_rounded, color: Colors.white, size: 28),
                  ),
                  const SizedBox(height: 12),
                  Text('82.5', style: AppTypography.numericDataLarge),
                  Text('kg', style: AppTypography.bodyS),
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: GlassCard(
              margin: EdgeInsets.zero,
              onTap: () => context.go('/dashboard/analytics'),
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                    child: const Icon(Icons.trending_up_rounded, color: Colors.white, size: 28),
                  ),
                  const SizedBox(height: 12),
                  Text('12,400', style: AppTypography.numericDataLarge),
                  Text('kg / week', style: AppTypography.bodyS),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GlassCard(
            margin: const EdgeInsets.only(bottom: 12),
            onTap: () => context.push('/program-builder'),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceGlass,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.edit_note_rounded, color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Program Builder', style: AppTypography.h4),
                      Text('Create a custom mesocycle', style: AppTypography.bodyS),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              ],
            ),
          ),
          GlassCard(
            margin: const EdgeInsets.only(bottom: 12),
            onTap: () => context.push('/body-weight'),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceGlass,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.scale_rounded, color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Log Body Weight', style: AppTypography.h4),
                      Text('Track your morning weigh-in', style: AppTypography.bodyS),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
