import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/user_profile.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/di/injection.dart';
import '../../../widgets/precision_widgets.dart';

class OnboardingSurveyScreen extends StatefulWidget {
  const OnboardingSurveyScreen({super.key});

  @override
  State<OnboardingSurveyScreen> createState() => _OnboardingSurveyScreenState();
}

class _OnboardingSurveyScreenState extends State<OnboardingSurveyScreen> with SingleTickerProviderStateMixin {
  int _currentStep = 0;
  
  Goal _selectedGoal = Goal.hypertrophy;
  ExperienceLevel _selectedExperience = ExperienceLevel.intermediate;
  int _daysPerWeek = 4;
  int _durationMinutes = 60;

  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _fadeAnimation = CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    _animController.reverse().then((_) {
      setState(() => _currentStep = step);
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingBloc>(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            context.go('/onboarding/gym');
          }
        },
        builder: (context, state) {
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
                    // ── Progress bar ──
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: Row(
                        children: List.generate(3, (i) {
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: i < 2 ? 8 : 0),
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                gradient: i <= _currentStep ? const LinearGradient(colors: [AppColors.primary, AppColors.primaryDim]) : null,
                                color: i <= _currentStep ? null : AppColors.border,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // ── Content ──
                    Expanded(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildCurrentStep(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentStep(BuildContext context) {
    switch (_currentStep) {
      case 0:
        return _buildGoalSelection();
      case 1:
        return _buildExperienceSelection();
      case 2:
        return _buildScheduleSelection(context);
      default:
        return const SizedBox();
    }
  }

  Widget _buildGoalSelection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.primaryDim]).createShader(bounds),
            child: Text('What drives you?', style: AppTypography.h1.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 8),
          Text('Choose your primary training goal', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 40),
          _buildSelectableOption(
            title: 'Hypertrophy',
            subtitle: 'Build muscle mass and size',
            icon: Icons.fitness_center_rounded,
            isSelected: _selectedGoal == Goal.hypertrophy,
            onTap: () => setState(() => _selectedGoal = Goal.hypertrophy),
          ),
          const SizedBox(height: 14),
          _buildSelectableOption(
            title: 'Strength',
            subtitle: 'Increase max power and lifting capacity',
            icon: Icons.bolt_rounded,
            isSelected: _selectedGoal == Goal.strength,
            onTap: () => setState(() => _selectedGoal = Goal.strength),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'Continue',
            onPressed: () => _goToStep(1),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildExperienceSelection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.primaryDim]).createShader(bounds),
            child: Text('Your journey', style: AppTypography.h1.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 8),
          Text('How long have you been training?', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 40),
          _buildSelectableOption(
            title: 'Beginner',
            subtitle: '< 1 year of consistent training',
            icon: Icons.emoji_nature_rounded,
            isSelected: _selectedExperience == ExperienceLevel.beginner,
            onTap: () => setState(() => _selectedExperience = ExperienceLevel.beginner),
          ),
          const SizedBox(height: 14),
          _buildSelectableOption(
            title: 'Intermediate',
            subtitle: '1-3 years of consistent training',
            icon: Icons.trending_up_rounded,
            isSelected: _selectedExperience == ExperienceLevel.intermediate,
            onTap: () => setState(() => _selectedExperience = ExperienceLevel.intermediate),
          ),
          const SizedBox(height: 14),
          _buildSelectableOption(
            title: 'Advanced',
            subtitle: '> 3 years of consistent training',
            icon: Icons.military_tech_rounded,
            isSelected: _selectedExperience == ExperienceLevel.advanced,
            onTap: () => setState(() => _selectedExperience = ExperienceLevel.advanced),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'Continue',
            onPressed: () => _goToStep(2),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildScheduleSelection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.primaryDim]).createShader(bounds),
            child: Text('Your rhythm', style: AppTypography.h1.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 8),
          Text('How do you like to train?', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 40),
          MetricCard(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Days per week', style: AppTypography.h4),
                    Text('$_daysPerWeek', style: AppTypography.numericDataLarge.copyWith(color: AppColors.primary)),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.border,
                    thumbColor: AppColors.primary,
                    overlayColor: AppColors.primaryDim,
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: _daysPerWeek.toDouble(),
                    min: 1,
                    max: 7,
                    divisions: 6,
                    onChanged: (v) => setState(() => _daysPerWeek = v.toInt()),
                  ),
                ),
              ],
            ),
          ),
          MetricCard(
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Session length', style: AppTypography.h4),
                    Text('$_durationMinutes min', style: AppTypography.numericDataLarge.copyWith(color: AppColors.primary)),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.border,
                    thumbColor: AppColors.primary,
                    overlayColor: AppColors.primaryDim,
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: _durationMinutes.toDouble(),
                    min: 30,
                    max: 180,
                    divisions: 10,
                    onChanged: (v) => setState(() => _durationMinutes = v.toInt()),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'Complete Setup',
            icon: Icons.check_rounded,
            onPressed: () {
              context.read<OnboardingBloc>().add(
                CompleteOnboardingSurvey(
                  goal: _selectedGoal,
                  experience: _selectedExperience,
                  daysPerWeek: _daysPerWeek,
                  durationMinutes: _durationMinutes,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSelectableOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: isSelected ? const LinearGradient(colors: [AppColors.surfaceElevated, AppColors.surfaceElevated]) : null,
          color: isSelected ? null : AppColors.surfaceGlass,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 1.5 : 0.5,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primaryGlow, blurRadius: 20, spreadRadius: -4)]
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryDim : AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: isSelected ? AppColors.primary : AppColors.textMuted, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.h4.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTypography.bodyS),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDim]),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }
}
