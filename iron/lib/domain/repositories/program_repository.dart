import '../entities/program.dart';

abstract class ProgramRepository {
  Future<void> saveProgram(Program program);
  Future<Program?> getActiveProgram();
  Future<List<Program>> getAllPrograms();
  Future<void> deleteProgram(String id);
}
