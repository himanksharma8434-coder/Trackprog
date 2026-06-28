import 'package:injectable/injectable.dart';
import '../../domain/entities/gym_profile.dart';
import '../../domain/repositories/gym_profile_repository.dart';

@LazySingleton(as: GymProfileRepository)
class GymProfileRepositoryImpl implements GymProfileRepository {
  @override
  Future<void> saveGymProfile(GymProfile profile) async {}

  @override
  Future<List<GymProfile>> getAllGymProfiles() async => [];

  @override
  Future<GymProfile?> getActiveGymProfile() async => null;
}
