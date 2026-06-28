import 'package:equatable/equatable.dart';

enum SetType { normal, warmup, dropset, myorep, failure, partial }

class SetLog extends Equatable {
  final String id;
  final int setNumber;
  final SetType type;
  final double weightKg;
  final int reps;
  final int? rir;
  final int? partialReps;
  final bool? isLeft;
  final bool? isRight;
  final DateTime loggedAt;

  const SetLog({
    required this.id,
    required this.setNumber,
    required this.type,
    required this.weightKg,
    required this.reps,
    this.rir,
    this.partialReps,
    this.isLeft,
    this.isRight,
    required this.loggedAt,
  });

  @override
  List<Object?> get props => [id, setNumber, type, weightKg, reps, rir, partialReps, isLeft, isRight, loggedAt];
  Map<String, dynamic> toJson() => {
        'id': id,
        'setNumber': setNumber,
        'type': type.name,
        'weightKg': weightKg,
        'reps': reps,
        'rir': rir,
        'partialReps': partialReps,
        'isLeft': isLeft,
        'isRight': isRight,
        'loggedAt': loggedAt.toIso8601String(),
      };

  factory SetLog.fromJson(Map<String, dynamic> json) => SetLog(
        id: json['id'],
        setNumber: json['setNumber'],
        type: SetType.values.firstWhere((e) => e.name == json['type'], orElse: () => SetType.normal),
        weightKg: json['weightKg'],
        reps: json['reps'],
        rir: json['rir'],
        partialReps: json['partialReps'],
        isLeft: json['isLeft'],
        isRight: json['isRight'],
        loggedAt: DateTime.parse(json['loggedAt']),
      );
}

class ExerciseLog extends Equatable {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final int orderInSession;
  final List<SetLog> sets;

  const ExerciseLog({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    required this.orderInSession,
    required this.sets,
  });

  @override
  List<Object?> get props => [id, exerciseId, exerciseName, orderInSession, sets];

  ExerciseLog copyWith({
    String? id,
    String? exerciseId,
    String? exerciseName,
    int? orderInSession,
    List<SetLog>? sets,
  }) {
    return ExerciseLog(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      orderInSession: orderInSession ?? this.orderInSession,
      sets: sets ?? this.sets,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'exerciseId': exerciseId,
        'exerciseName': exerciseName,
        'orderInSession': orderInSession,
        'sets': sets.map((e) => e.toJson()).toList(),
      };

  factory ExerciseLog.fromJson(Map<String, dynamic> json) => ExerciseLog(
        id: json['id'],
        exerciseId: json['exerciseId'],
        exerciseName: json['exerciseName'],
        orderInSession: json['orderInSession'],
        sets: (json['sets'] as List).map((e) => SetLog.fromJson(e)).toList(),
      );
}

class WorkoutSession extends Equatable {
  final String id;
  final String? programDayId;
  final String name;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final int durationSeconds;
  final double totalVolumeKg;
  final List<ExerciseLog> exerciseLogs;
  final int? sessionRpe;
  final String? note;

  const WorkoutSession({
    required this.id,
    this.programDayId,
    required this.name,
    required this.startedAt,
    this.finishedAt,
    this.durationSeconds = 0,
    this.totalVolumeKg = 0.0,
    required this.exerciseLogs,
    this.sessionRpe,
    this.note,
  });

  @override
  List<Object?> get props => [id, programDayId, name, startedAt, finishedAt, durationSeconds, totalVolumeKg, exerciseLogs, sessionRpe, note];

  WorkoutSession copyWith({
    String? id,
    String? programDayId,
    String? name,
    DateTime? startedAt,
    DateTime? finishedAt,
    int? durationSeconds,
    double? totalVolumeKg,
    List<ExerciseLog>? exerciseLogs,
    int? sessionRpe,
    String? note,
  }) {
    return WorkoutSession(
      id: id ?? this.id,
      programDayId: programDayId ?? this.programDayId,
      name: name ?? this.name,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
      exerciseLogs: exerciseLogs ?? this.exerciseLogs,
      sessionRpe: sessionRpe ?? this.sessionRpe,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'programDayId': programDayId,
        'name': name,
        'startedAt': startedAt.toIso8601String(),
        'finishedAt': finishedAt?.toIso8601String(),
        'durationSeconds': durationSeconds,
        'totalVolumeKg': totalVolumeKg,
        'exerciseLogs': exerciseLogs.map((e) => e.toJson()).toList(),
        'sessionRpe': sessionRpe,
        'note': note,
      };

  factory WorkoutSession.fromJson(Map<String, dynamic> json) => WorkoutSession(
        id: json['id'],
        programDayId: json['programDayId'],
        name: json['name'],
        startedAt: DateTime.parse(json['startedAt']),
        finishedAt: json['finishedAt'] != null ? DateTime.parse(json['finishedAt']) : null,
        durationSeconds: json['durationSeconds'] ?? 0,
        totalVolumeKg: json['totalVolumeKg'] ?? 0.0,
        exerciseLogs: (json['exerciseLogs'] as List).map((e) => ExerciseLog.fromJson(e)).toList(),
        sessionRpe: json['sessionRpe'],
        note: json['note'],
      );
}
