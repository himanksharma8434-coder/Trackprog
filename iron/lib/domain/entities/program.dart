import 'package:equatable/equatable.dart';
import 'workout.dart';

class ProgramSet extends Equatable {
  final String id;
  final int setNumber;
  final int? targetReps;
  final double? targetWeight;
  final double? targetRpe;
  final SetType setType;

  const ProgramSet({
    required this.id,
    required this.setNumber,
    this.targetReps,
    this.targetWeight,
    this.targetRpe,
    this.setType = SetType.normal,
  });

  @override
  List<Object?> get props => [id, setNumber, targetReps, targetWeight, targetRpe, setType];

  ProgramSet copyWith({
    String? id,
    int? setNumber,
    int? targetReps,
    double? targetWeight,
    double? targetRpe,
    SetType? setType,
  }) {
    return ProgramSet(
      id: id ?? this.id,
      setNumber: setNumber ?? this.setNumber,
      targetReps: targetReps ?? this.targetReps,
      targetWeight: targetWeight ?? this.targetWeight,
      targetRpe: targetRpe ?? this.targetRpe,
      setType: setType ?? this.setType,
    );
  }
}

class ProgramExercise extends Equatable {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final List<ProgramSet> sets;
  final int restSeconds;
  final String? historicalHint;

  const ProgramExercise({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    required this.restSeconds,
    this.historicalHint,
  });

  @override
  List<Object?> get props => [id, exerciseId, exerciseName, sets, restSeconds, historicalHint];

  ProgramExercise copyWith({
    String? id,
    String? exerciseId,
    String? exerciseName,
    List<ProgramSet>? sets,
    int? restSeconds,
    String? historicalHint,
  }) {
    return ProgramExercise(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      sets: sets ?? this.sets,
      restSeconds: restSeconds ?? this.restSeconds,
      historicalHint: historicalHint ?? this.historicalHint,
    );
  }
}

class ProgramDay extends Equatable {
  final String id;
  final int dayNumber; // 1, 2, 3...
  final String name;
  final List<ProgramExercise> exercises;

  const ProgramDay({
    required this.id,
    required this.dayNumber,
    required this.name,
    required this.exercises,
  });

  @override
  List<Object?> get props => [id, dayNumber, name, exercises];

  ProgramDay copyWith({
    String? id,
    int? dayNumber,
    String? name,
    List<ProgramExercise>? exercises,
  }) {
    return ProgramDay(
      id: id ?? this.id,
      dayNumber: dayNumber ?? this.dayNumber,
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
    );
  }
}

class Program extends Equatable {
  final String id;
  final String name;
  final String? author;
  final List<ProgramDay> days;
  final bool isCustom;
  final bool isImported;
  final DateTime createdAt;

  const Program({
    required this.id,
    required this.name,
    this.author,
    required this.days,
    required this.isCustom,
    required this.isImported,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, author, days, isCustom, isImported, createdAt];

  Program copyWith({
    String? id,
    String? name,
    String? author,
    List<ProgramDay>? days,
    bool? isCustom,
    bool? isImported,
    DateTime? createdAt,
  }) {
    return Program(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      days: days ?? this.days,
      isCustom: isCustom ?? this.isCustom,
      isImported: isImported ?? this.isImported,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
