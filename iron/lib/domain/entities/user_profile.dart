enum Goal { hypertrophy, strength, powerbuilding }
enum ExperienceLevel { beginner, intermediate, advanced }
enum WeightUnit { kg, lbs }

class UserProfile {
  final String id;
  final String email;
  final Goal goal;
  final ExperienceLevel experience;
  final int trainingDaysPerWeek;
  final int sessionDurationMinutes;
  final WeightUnit unit;
  final String activeGymProfileId;
  final DateTime createdAt;

  UserProfile({
    required this.id,
    required this.email,
    required this.goal,
    required this.experience,
    required this.trainingDaysPerWeek,
    required this.sessionDurationMinutes,
    required this.unit,
    required this.activeGymProfileId,
    required this.createdAt,
  });
}
