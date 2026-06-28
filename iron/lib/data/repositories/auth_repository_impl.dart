import 'package:injectable/injectable.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  UserProfile? _currentUser;

  @override
  Future<UserProfile?> getCurrentUser() async => _currentUser;

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    _currentUser = profile;
  }
}
