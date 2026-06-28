import 'package:injectable/injectable.dart';
import '../../domain/entities/program.dart';
import '../../domain/repositories/program_repository.dart';

@LazySingleton(as: ProgramRepository)
class ProgramRepositoryImpl implements ProgramRepository {
  @override
  Future<void> saveProgram(Program program) async {}

  @override
  Future<Program?> getActiveProgram() async => null;

  @override
  Future<List<Program>> getAllPrograms() async => [];

  @override
  Future<void> deleteProgram(String id) async {}
}
