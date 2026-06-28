import '../entities/gym_profile.dart';

abstract class GymProfileRepository {
  Future<void> saveGymProfile(GymProfile profile);
  Future<List<GymProfile>> getAllGymProfiles();
  Future<GymProfile?> getActiveGymProfile();
}
