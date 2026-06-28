import 'package:injectable/injectable.dart';
import '../entities/program.dart';
import '../repositories/program_repository.dart';

@injectable
class GetActiveProgramUseCase {
  final ProgramRepository repository;
  GetActiveProgramUseCase(this.repository);

  Future<Program?> call() => repository.getActiveProgram();
}

@injectable
class BuildCustomProgramUseCase {
  final ProgramRepository repository;
  BuildCustomProgramUseCase(this.repository);

  Future<void> call(Program program) => repository.saveProgram(program);
}
