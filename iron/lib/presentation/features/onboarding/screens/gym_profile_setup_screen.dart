import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../widgets/glass_widgets.dart';

class GymProfileSetupScreen extends StatefulWidget {
  const GymProfileSetupScreen({super.key});

  @override
  State<GymProfileSetupScreen> createState() => _GymProfileSetupScreenState();
}

class _GymProfileSetupScreenState extends State<GymProfileSetupScreen> {
  final List<_EquipmentItem> _equipment = [
    _EquipmentItem('Barbell', Icons.fitness_center_rounded, true),
    _EquipmentItem('Dumbbells', Icons.sports_gymnastics_rounded, true),
    _EquipmentItem('Kettlebells', Icons.sports_handball_rounded, false),
    _EquipmentItem('Cables', Icons.cable_rounded, false),
    _EquipmentItem('Machines', Icons.precision_manufacturing_rounded, false),
    _EquipmentItem('Bands', Icons.gesture_rounded, false),
  ];

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                ShaderMask(
                  shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                  child: Text('Your equipment', style: AppTypography.h1.copyWith(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select what you have access to. This helps tailor your programs.',
                  style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.separated(
                    itemCount: _equipment.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _equipment[index];
                      return GestureDetector(
                        onTap: () => setState(() => item.isSelected = !item.isSelected),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: item.isSelected ? AppColors.glassGradient : null,
                            color: item.isSelected ? null : AppColors.surfaceGlass,
                            border: Border.all(
                              color: item.isSelected ? AppColors.primary : AppColors.borderGlass,
                              width: item.isSelected ? 1.5 : 0.5,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: item.isSelected
                                ? [BoxShadow(color: AppColors.primaryGlow, blurRadius: 16, spreadRadius: -4)]
                                : null,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: item.isSelected ? AppColors.primaryDim : AppColors.surfaceGlass,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item.icon,
                                  color: item.isSelected ? AppColors.primary : AppColors.textMuted,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                item.name,
                                style: AppTypography.h4.copyWith(
                                  color: item.isSelected ? AppColors.primary : AppColors.textPrimary,
                                ),
                              ),
                              const Spacer(),
                              if (item.isSelected)
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.primaryGradient,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                GlowButton(
                  label: 'Finish Setup',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () => context.go('/dashboard/home'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EquipmentItem {
  final String name;
  final IconData icon;
  bool isSelected;

  _EquipmentItem(this.name, this.icon, this.isSelected);
}
