import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../widgets/precision_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Text('Settings', style: AppTypography.h1),
              ),
            ),
            SliverToBoxAdapter(child: _buildSection(context, 'ACCOUNT', [
              _SettingItem(Icons.person_rounded, 'Profile Details', onTap: () => _showComingSoon(context, 'Profile Details')),
              _SettingItem(Icons.fitness_center_rounded, 'Gym Profiles', onTap: () => _showComingSoon(context, 'Gym Profiles')),
            ])),
            SliverToBoxAdapter(child: _buildSection(context, 'PREFERENCES', [
              _SettingItem(Icons.dark_mode_rounded, 'Theme', trailing: 'Dark', onTap: () => _showComingSoon(context, 'Theme Customization')),
              _SettingItem(Icons.monitor_weight_rounded, 'Weight Unit', trailing: 'kg', onTap: () => _showComingSoon(context, 'Weight Unit Change')),
              _SettingItem(Icons.timer_rounded, 'Default Rest', trailing: '90s', onTap: () => _showComingSoon(context, 'Default Rest Timer Change')),
            ])),
            SliverToBoxAdapter(child: _buildSection(context, 'DATA', [
              _SettingItem(Icons.download_rounded, 'Export Data', onTap: () => _showComingSoon(context, 'Data Export')),
              _SettingItem(Icons.delete_forever_rounded, 'Delete All Data', isDanger: true, onTap: () => _showDeleteConfirmation(context)),
            ])),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<_SettingItem> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(title, style: AppTypography.labelCaps.copyWith(letterSpacing: 2.0)),
          ),
          MetricCard(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(bottom: 28),
            child: Column(
              children: items.asMap().entries.map((entry) {
                final i = entry.key;
                final item = entry.value;
                return Column(
                  children: [
                    if (i > 0) Divider(color: AppColors.border, height: 1, indent: 56),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: item.onTap,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: item.isDanger ? AppColors.errorDim : AppColors.surfaceGlass,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  item.icon,
                                  color: item.isDanger ? AppColors.error : AppColors.primary,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  item.label,
                                  style: AppTypography.bodyL.copyWith(
                                    color: item.isDanger ? AppColors.error : AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              if (item.trailing != null)
                                Text(item.trailing!, style: AppTypography.bodyM.copyWith(color: AppColors.textMuted)),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.textMuted,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature coming soon.', style: AppTypography.bodyM.copyWith(color: AppColors.textPrimary)),
        backgroundColor: AppColors.surfaceElevated,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Delete All Data?', style: AppTypography.h3),
        content: Text(
          'This will permanently delete all your workouts, programs, and body metrics. This action cannot be undone.',
          style: AppTypography.bodyM,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: AppTypography.labelL.copyWith(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showComingSoon(context, 'Data deletion');
            },
            child: Text('Delete', style: AppTypography.labelL.copyWith(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}

class _SettingItem {
  final IconData icon;
  final String label;
  final String? trailing;
  final bool isDanger;
  final VoidCallback? onTap;

  const _SettingItem(this.icon, this.label, {this.trailing, this.isDanger = false, this.onTap});
}
