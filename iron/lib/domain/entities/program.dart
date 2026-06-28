import 'package:equatable/equatable.dart';
import 'workout.dart';

enum BlockType { accumulation, intensification, deload, custom }

class ProgramExercise extends Equatable {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final int sets;
  final int repMin;
  final int repMax;
  final int? rirTarget;
  final int restSeconds;
  final List<SetType> allowedSetTypes;

  const ProgramExercise({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    required this.repMin,
    required this.repMax,
    this.rirTarget,
    required this.restSeconds,
    this.allowedSetTypes = const [SetType.normal],
  });

  @override
  List<Object?> get props => [id, exerciseId, exerciseName, sets, repMin, repMax, rirTarget, restSeconds, allowedSetTypes];
}

class ProgramSession extends Equatable {
  final String id;
  final int dayOfWeek; // 1=Mon...7=Sun
  final String name;
  final List<ProgramExercise> exercises;
  final int estimatedDurationMinutes;

  const ProgramSession({
    required this.id,
    required this.dayOfWeek,
    required this.name,
    required this.exercises,
    required this.estimatedDurationMinutes,
  });

  @override
  List<Object?> get props => [id, dayOfWeek, name, exercises, estimatedDurationMinutes];

  ProgramSession copyWith({
    String? id,
    int? dayOfWeek,
    String? name,
    List<ProgramExercise>? exercises,
    int? estimatedDurationMinutes,
  }) {
    return ProgramSession(
      id: id ?? this.id,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
      estimatedDurationMinutes: estimatedDurationMinutes ?? this.estimatedDurationMinutes,
    );
  }
}

class ProgramBlock extends Equatable {
  final String id;
  final String name;
  final int weeks;
  final List<ProgramSession> sessions;
  final BlockType type;

  const ProgramBlock({
    required this.id,
    required this.name,
    required this.weeks,
    required this.sessions,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, weeks, sessions, type];

  ProgramBlock copyWith({
    String? id,
    String? name,
    int? weeks,
    List<ProgramSession>? sessions,
    BlockType? type,
  }) {
    return ProgramBlock(
      id: id ?? this.id,
      name: name ?? this.name,
      weeks: weeks ?? this.weeks,
      sessions: sessions ?? this.sessions,
      type: type ?? this.type,
    );
  }
}

class Program extends Equatable {
  final String id;
  final String name;
  final String? author;
  final int totalWeeks;
  final List<ProgramBlock> blocks;
  final bool isCustom;
  final bool isImported;
  final DateTime createdAt;

  const Program({
    required this.id,
    required this.name,
    this.author,
    required this.totalWeeks,
    required this.blocks,
    required this.isCustom,
    required this.isImported,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, author, totalWeeks, blocks, isCustom, isImported, createdAt];

  Program copyWith({
    String? id,
    String? name,
    String? author,
    int? totalWeeks,
    List<ProgramBlock>? blocks,
    bool? isCustom,
    bool? isImported,
    DateTime? createdAt,
  }) {
    return Program(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      totalWeeks: totalWeeks ?? this.totalWeeks,
      blocks: blocks ?? this.blocks,
      isCustom: isCustom ?? this.isCustom,
      isImported: isImported ?? this.isImported,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
