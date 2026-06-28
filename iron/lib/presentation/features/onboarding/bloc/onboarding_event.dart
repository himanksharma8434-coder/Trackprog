import 'package:equatable/equatable.dart';
import '../../../../domain/entities/user_profile.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
  @override
  List<Object?> get props => [];
}

class CheckOnboardingStatus extends OnboardingEvent {}

class CompleteOnboardingSurvey extends OnboardingEvent {
  final Goal goal;
  final ExperienceLevel experience;
  final int daysPerWeek;
  final int durationMinutes;

  const CompleteOnboardingSurvey({
    required this.goal,
    required this.experience,
    required this.daysPerWeek,
    required this.durationMinutes,
  });

  @override
  List<Object?> get props => [goal, experience, daysPerWeek, durationMinutes];
}
