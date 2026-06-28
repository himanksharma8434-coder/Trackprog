import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/user_profile.dart';
import '../../../../domain/repositories/auth_repository.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AuthRepository authRepository;

  OnboardingBloc(this.authRepository) : super(OnboardingInitial()) {
    on<CheckOnboardingStatus>((event, emit) async {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(OnboardingCompleted());
      } else {
        emit(OnboardingNeedsSetup());
      }
    });

    on<CompleteOnboardingSurvey>((event, emit) async {
      final user = UserProfile(
        id: 'local_user_1',
        email: 'local@iron.app',
        goal: event.goal,
        experience: event.experience,
        trainingDaysPerWeek: event.daysPerWeek,
        sessionDurationMinutes: event.durationMinutes,
        unit: WeightUnit.kg,
        activeGymProfileId: 'default_gym',
        createdAt: DateTime.now(),
      );
      await authRepository.saveUserProfile(user);
      emit(OnboardingCompleted());
    });
  }
}
