// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExercisesTableTable extends ExercisesTable
    with TableInfo<$ExercisesTableTable, ExerciseModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isCustom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $ExercisesTableTable createAlias(String alias) {
    return $ExercisesTableTable(attachedDatabase, alias);
  }
}

class ExerciseModel extends DataClass implements Insertable<ExerciseModel> {
  final String id;
  final String name;
  final bool isCustom;
  const ExerciseModel({
    required this.id,
    required this.name,
    required this.isCustom,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  ExercisesTableCompanion toCompanion(bool nullToAbsent) {
    return ExercisesTableCompanion(
      id: Value(id),
      name: Value(name),
      isCustom: Value(isCustom),
    );
  }

  factory ExerciseModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  ExerciseModel copyWith({String? id, String? name, bool? isCustom}) =>
      ExerciseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isCustom: isCustom ?? this.isCustom,
      );
  ExerciseModel copyWithCompanion(ExercisesTableCompanion data) {
    return ExerciseModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCustom == this.isCustom);
}

class ExercisesTableCompanion extends UpdateCompanion<ExerciseModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> isCustom;
  final Value<int> rowid;
  const ExercisesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesTableCompanion.insert({
    required String id,
    required String name,
    this.isCustom = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<ExerciseModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? isCustom,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCustom != null) 'is_custom': isCustom,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<bool>? isCustom,
    Value<int>? rowid,
  }) {
    return ExercisesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTableTable extends WorkoutSessionsTable
    with TableInfo<$WorkoutSessionsTableTable, WorkoutSessionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programSessionIdMeta = const VerificationMeta(
    'programSessionId',
  );
  @override
  late final GeneratedColumn<String> programSessionId = GeneratedColumn<String>(
    'program_session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalVolumeKgMeta = const VerificationMeta(
    'totalVolumeKg',
  );
  @override
  late final GeneratedColumn<double> totalVolumeKg = GeneratedColumn<double>(
    'total_volume_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sessionRpeMeta = const VerificationMeta(
    'sessionRpe',
  );
  @override
  late final GeneratedColumn<int> sessionRpe = GeneratedColumn<int>(
    'session_rpe',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    programSessionId,
    name,
    startedAt,
    finishedAt,
    durationSeconds,
    totalVolumeKg,
    sessionRpe,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSessionModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('program_session_id')) {
      context.handle(
        _programSessionIdMeta,
        programSessionId.isAcceptableOrUnknown(
          data['program_session_id']!,
          _programSessionIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('total_volume_kg')) {
      context.handle(
        _totalVolumeKgMeta,
        totalVolumeKg.isAcceptableOrUnknown(
          data['total_volume_kg']!,
          _totalVolumeKgMeta,
        ),
      );
    }
    if (data.containsKey('session_rpe')) {
      context.handle(
        _sessionRpeMeta,
        sessionRpe.isAcceptableOrUnknown(data['session_rpe']!, _sessionRpeMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSessionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSessionModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      programSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_session_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finished_at'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      totalVolumeKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume_kg'],
      )!,
      sessionRpe: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_rpe'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $WorkoutSessionsTableTable createAlias(String alias) {
    return $WorkoutSessionsTableTable(attachedDatabase, alias);
  }
}

class WorkoutSessionModel extends DataClass
    implements Insertable<WorkoutSessionModel> {
  final String id;
  final String? programSessionId;
  final String name;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final int durationSeconds;
  final double totalVolumeKg;
  final int? sessionRpe;
  final String? note;
  const WorkoutSessionModel({
    required this.id,
    this.programSessionId,
    required this.name,
    required this.startedAt,
    this.finishedAt,
    required this.durationSeconds,
    required this.totalVolumeKg,
    this.sessionRpe,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || programSessionId != null) {
      map['program_session_id'] = Variable<String>(programSessionId);
    }
    map['name'] = Variable<String>(name);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['total_volume_kg'] = Variable<double>(totalVolumeKg);
    if (!nullToAbsent || sessionRpe != null) {
      map['session_rpe'] = Variable<int>(sessionRpe);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  WorkoutSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsTableCompanion(
      id: Value(id),
      programSessionId: programSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(programSessionId),
      name: Value(name),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      durationSeconds: Value(durationSeconds),
      totalVolumeKg: Value(totalVolumeKg),
      sessionRpe: sessionRpe == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionRpe),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory WorkoutSessionModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSessionModel(
      id: serializer.fromJson<String>(json['id']),
      programSessionId: serializer.fromJson<String?>(json['programSessionId']),
      name: serializer.fromJson<String>(json['name']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      totalVolumeKg: serializer.fromJson<double>(json['totalVolumeKg']),
      sessionRpe: serializer.fromJson<int?>(json['sessionRpe']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'programSessionId': serializer.toJson<String?>(programSessionId),
      'name': serializer.toJson<String>(name),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'totalVolumeKg': serializer.toJson<double>(totalVolumeKg),
      'sessionRpe': serializer.toJson<int?>(sessionRpe),
      'note': serializer.toJson<String?>(note),
    };
  }

  WorkoutSessionModel copyWith({
    String? id,
    Value<String?> programSessionId = const Value.absent(),
    String? name,
    DateTime? startedAt,
    Value<DateTime?> finishedAt = const Value.absent(),
    int? durationSeconds,
    double? totalVolumeKg,
    Value<int?> sessionRpe = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => WorkoutSessionModel(
    id: id ?? this.id,
    programSessionId: programSessionId.present
        ? programSessionId.value
        : this.programSessionId,
    name: name ?? this.name,
    startedAt: startedAt ?? this.startedAt,
    finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
    sessionRpe: sessionRpe.present ? sessionRpe.value : this.sessionRpe,
    note: note.present ? note.value : this.note,
  );
  WorkoutSessionModel copyWithCompanion(WorkoutSessionsTableCompanion data) {
    return WorkoutSessionModel(
      id: data.id.present ? data.id.value : this.id,
      programSessionId: data.programSessionId.present
          ? data.programSessionId.value
          : this.programSessionId,
      name: data.name.present ? data.name.value : this.name,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      totalVolumeKg: data.totalVolumeKg.present
          ? data.totalVolumeKg.value
          : this.totalVolumeKg,
      sessionRpe: data.sessionRpe.present
          ? data.sessionRpe.value
          : this.sessionRpe,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionModel(')
          ..write('id: $id, ')
          ..write('programSessionId: $programSessionId, ')
          ..write('name: $name, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('sessionRpe: $sessionRpe, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    programSessionId,
    name,
    startedAt,
    finishedAt,
    durationSeconds,
    totalVolumeKg,
    sessionRpe,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSessionModel &&
          other.id == this.id &&
          other.programSessionId == this.programSessionId &&
          other.name == this.name &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.totalVolumeKg == this.totalVolumeKg &&
          other.sessionRpe == this.sessionRpe &&
          other.note == this.note);
}

class WorkoutSessionsTableCompanion
    extends UpdateCompanion<WorkoutSessionModel> {
  final Value<String> id;
  final Value<String?> programSessionId;
  final Value<String> name;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<int> durationSeconds;
  final Value<double> totalVolumeKg;
  final Value<int?> sessionRpe;
  final Value<String?> note;
  final Value<int> rowid;
  const WorkoutSessionsTableCompanion({
    this.id = const Value.absent(),
    this.programSessionId = const Value.absent(),
    this.name = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.sessionRpe = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsTableCompanion.insert({
    required String id,
    this.programSessionId = const Value.absent(),
    required String name,
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.sessionRpe = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       startedAt = Value(startedAt);
  static Insertable<WorkoutSessionModel> custom({
    Expression<String>? id,
    Expression<String>? programSessionId,
    Expression<String>? name,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<int>? durationSeconds,
    Expression<double>? totalVolumeKg,
    Expression<int>? sessionRpe,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (programSessionId != null) 'program_session_id': programSessionId,
      if (name != null) 'name': name,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (totalVolumeKg != null) 'total_volume_kg': totalVolumeKg,
      if (sessionRpe != null) 'session_rpe': sessionRpe,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? programSessionId,
    Value<String>? name,
    Value<DateTime>? startedAt,
    Value<DateTime?>? finishedAt,
    Value<int>? durationSeconds,
    Value<double>? totalVolumeKg,
    Value<int?>? sessionRpe,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return WorkoutSessionsTableCompanion(
      id: id ?? this.id,
      programSessionId: programSessionId ?? this.programSessionId,
      name: name ?? this.name,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
      sessionRpe: sessionRpe ?? this.sessionRpe,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (programSessionId.present) {
      map['program_session_id'] = Variable<String>(programSessionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (totalVolumeKg.present) {
      map['total_volume_kg'] = Variable<double>(totalVolumeKg.value);
    }
    if (sessionRpe.present) {
      map['session_rpe'] = Variable<int>(sessionRpe.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('programSessionId: $programSessionId, ')
          ..write('name: $name, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('sessionRpe: $sessionRpe, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseLogsTableTable extends ExerciseLogsTable
    with TableInfo<$ExerciseLogsTableTable, ExerciseLogModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workoutSessionIdMeta = const VerificationMeta(
    'workoutSessionId',
  );
  @override
  late final GeneratedColumn<String> workoutSessionId = GeneratedColumn<String>(
    'workout_session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_sessions_table (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseNameMeta = const VerificationMeta(
    'exerciseName',
  );
  @override
  late final GeneratedColumn<String> exerciseName = GeneratedColumn<String>(
    'exercise_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderInSessionMeta = const VerificationMeta(
    'orderInSession',
  );
  @override
  late final GeneratedColumn<int> orderInSession = GeneratedColumn<int>(
    'order_in_session',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutSessionId,
    exerciseId,
    exerciseName,
    orderInSession,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_logs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseLogModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workout_session_id')) {
      context.handle(
        _workoutSessionIdMeta,
        workoutSessionId.isAcceptableOrUnknown(
          data['workout_session_id']!,
          _workoutSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutSessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
        _exerciseNameMeta,
        exerciseName.isAcceptableOrUnknown(
          data['exercise_name']!,
          _exerciseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    if (data.containsKey('order_in_session')) {
      context.handle(
        _orderInSessionMeta,
        orderInSession.isAcceptableOrUnknown(
          data['order_in_session']!,
          _orderInSessionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_orderInSessionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseLogModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseLogModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workoutSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workout_session_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      exerciseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_name'],
      )!,
      orderInSession: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_in_session'],
      )!,
    );
  }

  @override
  $ExerciseLogsTableTable createAlias(String alias) {
    return $ExerciseLogsTableTable(attachedDatabase, alias);
  }
}

class ExerciseLogModel extends DataClass
    implements Insertable<ExerciseLogModel> {
  final String id;
  final String workoutSessionId;
  final String exerciseId;
  final String exerciseName;
  final int orderInSession;
  const ExerciseLogModel({
    required this.id,
    required this.workoutSessionId,
    required this.exerciseId,
    required this.exerciseName,
    required this.orderInSession,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workout_session_id'] = Variable<String>(workoutSessionId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['exercise_name'] = Variable<String>(exerciseName);
    map['order_in_session'] = Variable<int>(orderInSession);
    return map;
  }

  ExerciseLogsTableCompanion toCompanion(bool nullToAbsent) {
    return ExerciseLogsTableCompanion(
      id: Value(id),
      workoutSessionId: Value(workoutSessionId),
      exerciseId: Value(exerciseId),
      exerciseName: Value(exerciseName),
      orderInSession: Value(orderInSession),
    );
  }

  factory ExerciseLogModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseLogModel(
      id: serializer.fromJson<String>(json['id']),
      workoutSessionId: serializer.fromJson<String>(json['workoutSessionId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
      orderInSession: serializer.fromJson<int>(json['orderInSession']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workoutSessionId': serializer.toJson<String>(workoutSessionId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseName': serializer.toJson<String>(exerciseName),
      'orderInSession': serializer.toJson<int>(orderInSession),
    };
  }

  ExerciseLogModel copyWith({
    String? id,
    String? workoutSessionId,
    String? exerciseId,
    String? exerciseName,
    int? orderInSession,
  }) => ExerciseLogModel(
    id: id ?? this.id,
    workoutSessionId: workoutSessionId ?? this.workoutSessionId,
    exerciseId: exerciseId ?? this.exerciseId,
    exerciseName: exerciseName ?? this.exerciseName,
    orderInSession: orderInSession ?? this.orderInSession,
  );
  ExerciseLogModel copyWithCompanion(ExerciseLogsTableCompanion data) {
    return ExerciseLogModel(
      id: data.id.present ? data.id.value : this.id,
      workoutSessionId: data.workoutSessionId.present
          ? data.workoutSessionId.value
          : this.workoutSessionId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      exerciseName: data.exerciseName.present
          ? data.exerciseName.value
          : this.exerciseName,
      orderInSession: data.orderInSession.present
          ? data.orderInSession.value
          : this.orderInSession,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseLogModel(')
          ..write('id: $id, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('orderInSession: $orderInSession')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workoutSessionId,
    exerciseId,
    exerciseName,
    orderInSession,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseLogModel &&
          other.id == this.id &&
          other.workoutSessionId == this.workoutSessionId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseName == this.exerciseName &&
          other.orderInSession == this.orderInSession);
}

class ExerciseLogsTableCompanion extends UpdateCompanion<ExerciseLogModel> {
  final Value<String> id;
  final Value<String> workoutSessionId;
  final Value<String> exerciseId;
  final Value<String> exerciseName;
  final Value<int> orderInSession;
  final Value<int> rowid;
  const ExerciseLogsTableCompanion({
    this.id = const Value.absent(),
    this.workoutSessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseName = const Value.absent(),
    this.orderInSession = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseLogsTableCompanion.insert({
    required String id,
    required String workoutSessionId,
    required String exerciseId,
    required String exerciseName,
    required int orderInSession,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workoutSessionId = Value(workoutSessionId),
       exerciseId = Value(exerciseId),
       exerciseName = Value(exerciseName),
       orderInSession = Value(orderInSession);
  static Insertable<ExerciseLogModel> custom({
    Expression<String>? id,
    Expression<String>? workoutSessionId,
    Expression<String>? exerciseId,
    Expression<String>? exerciseName,
    Expression<int>? orderInSession,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutSessionId != null) 'workout_session_id': workoutSessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseName != null) 'exercise_name': exerciseName,
      if (orderInSession != null) 'order_in_session': orderInSession,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseLogsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? workoutSessionId,
    Value<String>? exerciseId,
    Value<String>? exerciseName,
    Value<int>? orderInSession,
    Value<int>? rowid,
  }) {
    return ExerciseLogsTableCompanion(
      id: id ?? this.id,
      workoutSessionId: workoutSessionId ?? this.workoutSessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      orderInSession: orderInSession ?? this.orderInSession,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workoutSessionId.present) {
      map['workout_session_id'] = Variable<String>(workoutSessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    if (orderInSession.present) {
      map['order_in_session'] = Variable<int>(orderInSession.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('orderInSession: $orderInSession, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetLogsTableTable extends SetLogsTable
    with TableInfo<$SetLogsTableTable, SetLogModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseLogIdMeta = const VerificationMeta(
    'exerciseLogId',
  );
  @override
  late final GeneratedColumn<String> exerciseLogId = GeneratedColumn<String>(
    'exercise_log_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercise_logs_table (id)',
    ),
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SetType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<SetType>($SetLogsTableTable.$convertertype);
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rirMeta = const VerificationMeta('rir');
  @override
  late final GeneratedColumn<int> rir = GeneratedColumn<int>(
    'rir',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _partialRepsMeta = const VerificationMeta(
    'partialReps',
  );
  @override
  late final GeneratedColumn<int> partialReps = GeneratedColumn<int>(
    'partial_reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLeftMeta = const VerificationMeta('isLeft');
  @override
  late final GeneratedColumn<bool> isLeft = GeneratedColumn<bool>(
    'is_left',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_left" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isRightMeta = const VerificationMeta(
    'isRight',
  );
  @override
  late final GeneratedColumn<bool> isRight = GeneratedColumn<bool>(
    'is_right',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_right" IN (0, 1))',
    ),
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    exerciseLogId,
    setNumber,
    type,
    weightKg,
    reps,
    rir,
    partialReps,
    isLeft,
    isRight,
    loggedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_logs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetLogModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('exercise_log_id')) {
      context.handle(
        _exerciseLogIdMeta,
        exerciseLogId.isAcceptableOrUnknown(
          data['exercise_log_id']!,
          _exerciseLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseLogIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('rir')) {
      context.handle(
        _rirMeta,
        rir.isAcceptableOrUnknown(data['rir']!, _rirMeta),
      );
    }
    if (data.containsKey('partial_reps')) {
      context.handle(
        _partialRepsMeta,
        partialReps.isAcceptableOrUnknown(
          data['partial_reps']!,
          _partialRepsMeta,
        ),
      );
    }
    if (data.containsKey('is_left')) {
      context.handle(
        _isLeftMeta,
        isLeft.isAcceptableOrUnknown(data['is_left']!, _isLeftMeta),
      );
    }
    if (data.containsKey('is_right')) {
      context.handle(
        _isRightMeta,
        isRight.isAcceptableOrUnknown(data['is_right']!, _isRightMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetLogModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetLogModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      exerciseLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_log_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      type: $SetLogsTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      rir: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rir'],
      ),
      partialReps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partial_reps'],
      ),
      isLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_left'],
      ),
      isRight: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_right'],
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  $SetLogsTableTable createAlias(String alias) {
    return $SetLogsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SetType, int, int> $convertertype =
      const EnumIndexConverter<SetType>(SetType.values);
}

class SetLogModel extends DataClass implements Insertable<SetLogModel> {
  final String id;
  final String exerciseLogId;
  final int setNumber;
  final SetType type;
  final double weightKg;
  final int reps;
  final int? rir;
  final int? partialReps;
  final bool? isLeft;
  final bool? isRight;
  final DateTime loggedAt;
  const SetLogModel({
    required this.id,
    required this.exerciseLogId,
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['exercise_log_id'] = Variable<String>(exerciseLogId);
    map['set_number'] = Variable<int>(setNumber);
    {
      map['type'] = Variable<int>(
        $SetLogsTableTable.$convertertype.toSql(type),
      );
    }
    map['weight_kg'] = Variable<double>(weightKg);
    map['reps'] = Variable<int>(reps);
    if (!nullToAbsent || rir != null) {
      map['rir'] = Variable<int>(rir);
    }
    if (!nullToAbsent || partialReps != null) {
      map['partial_reps'] = Variable<int>(partialReps);
    }
    if (!nullToAbsent || isLeft != null) {
      map['is_left'] = Variable<bool>(isLeft);
    }
    if (!nullToAbsent || isRight != null) {
      map['is_right'] = Variable<bool>(isRight);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  SetLogsTableCompanion toCompanion(bool nullToAbsent) {
    return SetLogsTableCompanion(
      id: Value(id),
      exerciseLogId: Value(exerciseLogId),
      setNumber: Value(setNumber),
      type: Value(type),
      weightKg: Value(weightKg),
      reps: Value(reps),
      rir: rir == null && nullToAbsent ? const Value.absent() : Value(rir),
      partialReps: partialReps == null && nullToAbsent
          ? const Value.absent()
          : Value(partialReps),
      isLeft: isLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(isLeft),
      isRight: isRight == null && nullToAbsent
          ? const Value.absent()
          : Value(isRight),
      loggedAt: Value(loggedAt),
    );
  }

  factory SetLogModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetLogModel(
      id: serializer.fromJson<String>(json['id']),
      exerciseLogId: serializer.fromJson<String>(json['exerciseLogId']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      type: $SetLogsTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      reps: serializer.fromJson<int>(json['reps']),
      rir: serializer.fromJson<int?>(json['rir']),
      partialReps: serializer.fromJson<int?>(json['partialReps']),
      isLeft: serializer.fromJson<bool?>(json['isLeft']),
      isRight: serializer.fromJson<bool?>(json['isRight']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'exerciseLogId': serializer.toJson<String>(exerciseLogId),
      'setNumber': serializer.toJson<int>(setNumber),
      'type': serializer.toJson<int>(
        $SetLogsTableTable.$convertertype.toJson(type),
      ),
      'weightKg': serializer.toJson<double>(weightKg),
      'reps': serializer.toJson<int>(reps),
      'rir': serializer.toJson<int?>(rir),
      'partialReps': serializer.toJson<int?>(partialReps),
      'isLeft': serializer.toJson<bool?>(isLeft),
      'isRight': serializer.toJson<bool?>(isRight),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  SetLogModel copyWith({
    String? id,
    String? exerciseLogId,
    int? setNumber,
    SetType? type,
    double? weightKg,
    int? reps,
    Value<int?> rir = const Value.absent(),
    Value<int?> partialReps = const Value.absent(),
    Value<bool?> isLeft = const Value.absent(),
    Value<bool?> isRight = const Value.absent(),
    DateTime? loggedAt,
  }) => SetLogModel(
    id: id ?? this.id,
    exerciseLogId: exerciseLogId ?? this.exerciseLogId,
    setNumber: setNumber ?? this.setNumber,
    type: type ?? this.type,
    weightKg: weightKg ?? this.weightKg,
    reps: reps ?? this.reps,
    rir: rir.present ? rir.value : this.rir,
    partialReps: partialReps.present ? partialReps.value : this.partialReps,
    isLeft: isLeft.present ? isLeft.value : this.isLeft,
    isRight: isRight.present ? isRight.value : this.isRight,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  SetLogModel copyWithCompanion(SetLogsTableCompanion data) {
    return SetLogModel(
      id: data.id.present ? data.id.value : this.id,
      exerciseLogId: data.exerciseLogId.present
          ? data.exerciseLogId.value
          : this.exerciseLogId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      type: data.type.present ? data.type.value : this.type,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      reps: data.reps.present ? data.reps.value : this.reps,
      rir: data.rir.present ? data.rir.value : this.rir,
      partialReps: data.partialReps.present
          ? data.partialReps.value
          : this.partialReps,
      isLeft: data.isLeft.present ? data.isLeft.value : this.isLeft,
      isRight: data.isRight.present ? data.isRight.value : this.isRight,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetLogModel(')
          ..write('id: $id, ')
          ..write('exerciseLogId: $exerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('type: $type, ')
          ..write('weightKg: $weightKg, ')
          ..write('reps: $reps, ')
          ..write('rir: $rir, ')
          ..write('partialReps: $partialReps, ')
          ..write('isLeft: $isLeft, ')
          ..write('isRight: $isRight, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    exerciseLogId,
    setNumber,
    type,
    weightKg,
    reps,
    rir,
    partialReps,
    isLeft,
    isRight,
    loggedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetLogModel &&
          other.id == this.id &&
          other.exerciseLogId == this.exerciseLogId &&
          other.setNumber == this.setNumber &&
          other.type == this.type &&
          other.weightKg == this.weightKg &&
          other.reps == this.reps &&
          other.rir == this.rir &&
          other.partialReps == this.partialReps &&
          other.isLeft == this.isLeft &&
          other.isRight == this.isRight &&
          other.loggedAt == this.loggedAt);
}

class SetLogsTableCompanion extends UpdateCompanion<SetLogModel> {
  final Value<String> id;
  final Value<String> exerciseLogId;
  final Value<int> setNumber;
  final Value<SetType> type;
  final Value<double> weightKg;
  final Value<int> reps;
  final Value<int?> rir;
  final Value<int?> partialReps;
  final Value<bool?> isLeft;
  final Value<bool?> isRight;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const SetLogsTableCompanion({
    this.id = const Value.absent(),
    this.exerciseLogId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.type = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.reps = const Value.absent(),
    this.rir = const Value.absent(),
    this.partialReps = const Value.absent(),
    this.isLeft = const Value.absent(),
    this.isRight = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetLogsTableCompanion.insert({
    required String id,
    required String exerciseLogId,
    required int setNumber,
    required SetType type,
    required double weightKg,
    required int reps,
    this.rir = const Value.absent(),
    this.partialReps = const Value.absent(),
    this.isLeft = const Value.absent(),
    this.isRight = const Value.absent(),
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       exerciseLogId = Value(exerciseLogId),
       setNumber = Value(setNumber),
       type = Value(type),
       weightKg = Value(weightKg),
       reps = Value(reps),
       loggedAt = Value(loggedAt);
  static Insertable<SetLogModel> custom({
    Expression<String>? id,
    Expression<String>? exerciseLogId,
    Expression<int>? setNumber,
    Expression<int>? type,
    Expression<double>? weightKg,
    Expression<int>? reps,
    Expression<int>? rir,
    Expression<int>? partialReps,
    Expression<bool>? isLeft,
    Expression<bool>? isRight,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseLogId != null) 'exercise_log_id': exerciseLogId,
      if (setNumber != null) 'set_number': setNumber,
      if (type != null) 'type': type,
      if (weightKg != null) 'weight_kg': weightKg,
      if (reps != null) 'reps': reps,
      if (rir != null) 'rir': rir,
      if (partialReps != null) 'partial_reps': partialReps,
      if (isLeft != null) 'is_left': isLeft,
      if (isRight != null) 'is_right': isRight,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetLogsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? exerciseLogId,
    Value<int>? setNumber,
    Value<SetType>? type,
    Value<double>? weightKg,
    Value<int>? reps,
    Value<int?>? rir,
    Value<int?>? partialReps,
    Value<bool?>? isLeft,
    Value<bool?>? isRight,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return SetLogsTableCompanion(
      id: id ?? this.id,
      exerciseLogId: exerciseLogId ?? this.exerciseLogId,
      setNumber: setNumber ?? this.setNumber,
      type: type ?? this.type,
      weightKg: weightKg ?? this.weightKg,
      reps: reps ?? this.reps,
      rir: rir ?? this.rir,
      partialReps: partialReps ?? this.partialReps,
      isLeft: isLeft ?? this.isLeft,
      isRight: isRight ?? this.isRight,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (exerciseLogId.present) {
      map['exercise_log_id'] = Variable<String>(exerciseLogId.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $SetLogsTableTable.$convertertype.toSql(type.value),
      );
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (rir.present) {
      map['rir'] = Variable<int>(rir.value);
    }
    if (partialReps.present) {
      map['partial_reps'] = Variable<int>(partialReps.value);
    }
    if (isLeft.present) {
      map['is_left'] = Variable<bool>(isLeft.value);
    }
    if (isRight.present) {
      map['is_right'] = Variable<bool>(isRight.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('exerciseLogId: $exerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('type: $type, ')
          ..write('weightKg: $weightKg, ')
          ..write('reps: $reps, ')
          ..write('rir: $rir, ')
          ..write('partialReps: $partialReps, ')
          ..write('isLeft: $isLeft, ')
          ..write('isRight: $isRight, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramsTableTable extends ProgramsTable
    with TableInfo<$ProgramsTableTable, ProgramModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalWeeksMeta = const VerificationMeta(
    'totalWeeks',
  );
  @override
  late final GeneratedColumn<int> totalWeeks = GeneratedColumn<int>(
    'total_weeks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isImportedMeta = const VerificationMeta(
    'isImported',
  );
  @override
  late final GeneratedColumn<bool> isImported = GeneratedColumn<bool>(
    'is_imported',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_imported" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    author,
    totalWeeks,
    isCustom,
    isImported,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'programs_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('total_weeks')) {
      context.handle(
        _totalWeeksMeta,
        totalWeeks.isAcceptableOrUnknown(data['total_weeks']!, _totalWeeksMeta),
      );
    } else if (isInserting) {
      context.missing(_totalWeeksMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    } else if (isInserting) {
      context.missing(_isCustomMeta);
    }
    if (data.containsKey('is_imported')) {
      context.handle(
        _isImportedMeta,
        isImported.isAcceptableOrUnknown(data['is_imported']!, _isImportedMeta),
      );
    } else if (isInserting) {
      context.missing(_isImportedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      totalWeeks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_weeks'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      isImported: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_imported'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProgramsTableTable createAlias(String alias) {
    return $ProgramsTableTable(attachedDatabase, alias);
  }
}

class ProgramModel extends DataClass implements Insertable<ProgramModel> {
  final String id;
  final String name;
  final String? author;
  final int totalWeeks;
  final bool isCustom;
  final bool isImported;
  final DateTime createdAt;
  const ProgramModel({
    required this.id,
    required this.name,
    this.author,
    required this.totalWeeks,
    required this.isCustom,
    required this.isImported,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['total_weeks'] = Variable<int>(totalWeeks);
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_imported'] = Variable<bool>(isImported);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProgramsTableCompanion toCompanion(bool nullToAbsent) {
    return ProgramsTableCompanion(
      id: Value(id),
      name: Value(name),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      totalWeeks: Value(totalWeeks),
      isCustom: Value(isCustom),
      isImported: Value(isImported),
      createdAt: Value(createdAt),
    );
  }

  factory ProgramModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      author: serializer.fromJson<String?>(json['author']),
      totalWeeks: serializer.fromJson<int>(json['totalWeeks']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isImported: serializer.fromJson<bool>(json['isImported']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'author': serializer.toJson<String?>(author),
      'totalWeeks': serializer.toJson<int>(totalWeeks),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isImported': serializer.toJson<bool>(isImported),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProgramModel copyWith({
    String? id,
    String? name,
    Value<String?> author = const Value.absent(),
    int? totalWeeks,
    bool? isCustom,
    bool? isImported,
    DateTime? createdAt,
  }) => ProgramModel(
    id: id ?? this.id,
    name: name ?? this.name,
    author: author.present ? author.value : this.author,
    totalWeeks: totalWeeks ?? this.totalWeeks,
    isCustom: isCustom ?? this.isCustom,
    isImported: isImported ?? this.isImported,
    createdAt: createdAt ?? this.createdAt,
  );
  ProgramModel copyWithCompanion(ProgramsTableCompanion data) {
    return ProgramModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      author: data.author.present ? data.author.value : this.author,
      totalWeeks: data.totalWeeks.present
          ? data.totalWeeks.value
          : this.totalWeeks,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isImported: data.isImported.present
          ? data.isImported.value
          : this.isImported,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('totalWeeks: $totalWeeks, ')
          ..write('isCustom: $isCustom, ')
          ..write('isImported: $isImported, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    author,
    totalWeeks,
    isCustom,
    isImported,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.author == this.author &&
          other.totalWeeks == this.totalWeeks &&
          other.isCustom == this.isCustom &&
          other.isImported == this.isImported &&
          other.createdAt == this.createdAt);
}

class ProgramsTableCompanion extends UpdateCompanion<ProgramModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> author;
  final Value<int> totalWeeks;
  final Value<bool> isCustom;
  final Value<bool> isImported;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProgramsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.author = const Value.absent(),
    this.totalWeeks = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isImported = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramsTableCompanion.insert({
    required String id,
    required String name,
    this.author = const Value.absent(),
    required int totalWeeks,
    required bool isCustom,
    required bool isImported,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       totalWeeks = Value(totalWeeks),
       isCustom = Value(isCustom),
       isImported = Value(isImported),
       createdAt = Value(createdAt);
  static Insertable<ProgramModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? author,
    Expression<int>? totalWeeks,
    Expression<bool>? isCustom,
    Expression<bool>? isImported,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (author != null) 'author': author,
      if (totalWeeks != null) 'total_weeks': totalWeeks,
      if (isCustom != null) 'is_custom': isCustom,
      if (isImported != null) 'is_imported': isImported,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? author,
    Value<int>? totalWeeks,
    Value<bool>? isCustom,
    Value<bool>? isImported,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProgramsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      totalWeeks: totalWeeks ?? this.totalWeeks,
      isCustom: isCustom ?? this.isCustom,
      isImported: isImported ?? this.isImported,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (totalWeeks.present) {
      map['total_weeks'] = Variable<int>(totalWeeks.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isImported.present) {
      map['is_imported'] = Variable<bool>(isImported.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('author: $author, ')
          ..write('totalWeeks: $totalWeeks, ')
          ..write('isCustom: $isCustom, ')
          ..write('isImported: $isImported, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramBlocksTableTable extends ProgramBlocksTable
    with TableInfo<$ProgramBlocksTableTable, ProgramBlockModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramBlocksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programIdMeta = const VerificationMeta(
    'programId',
  );
  @override
  late final GeneratedColumn<String> programId = GeneratedColumn<String>(
    'program_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES programs_table (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weeksMeta = const VerificationMeta('weeks');
  @override
  late final GeneratedColumn<int> weeks = GeneratedColumn<int>(
    'weeks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<BlockType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<BlockType>($ProgramBlocksTableTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, programId, name, weeks, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_blocks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramBlockModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('program_id')) {
      context.handle(
        _programIdMeta,
        programId.isAcceptableOrUnknown(data['program_id']!, _programIdMeta),
      );
    } else if (isInserting) {
      context.missing(_programIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weeks')) {
      context.handle(
        _weeksMeta,
        weeks.isAcceptableOrUnknown(data['weeks']!, _weeksMeta),
      );
    } else if (isInserting) {
      context.missing(_weeksMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramBlockModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramBlockModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      programId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weeks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weeks'],
      )!,
      type: $ProgramBlocksTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
    );
  }

  @override
  $ProgramBlocksTableTable createAlias(String alias) {
    return $ProgramBlocksTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<BlockType, int, int> $convertertype =
      const EnumIndexConverter<BlockType>(BlockType.values);
}

class ProgramBlockModel extends DataClass
    implements Insertable<ProgramBlockModel> {
  final String id;
  final String programId;
  final String name;
  final int weeks;
  final BlockType type;
  const ProgramBlockModel({
    required this.id,
    required this.programId,
    required this.name,
    required this.weeks,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['program_id'] = Variable<String>(programId);
    map['name'] = Variable<String>(name);
    map['weeks'] = Variable<int>(weeks);
    {
      map['type'] = Variable<int>(
        $ProgramBlocksTableTable.$convertertype.toSql(type),
      );
    }
    return map;
  }

  ProgramBlocksTableCompanion toCompanion(bool nullToAbsent) {
    return ProgramBlocksTableCompanion(
      id: Value(id),
      programId: Value(programId),
      name: Value(name),
      weeks: Value(weeks),
      type: Value(type),
    );
  }

  factory ProgramBlockModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramBlockModel(
      id: serializer.fromJson<String>(json['id']),
      programId: serializer.fromJson<String>(json['programId']),
      name: serializer.fromJson<String>(json['name']),
      weeks: serializer.fromJson<int>(json['weeks']),
      type: $ProgramBlocksTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'programId': serializer.toJson<String>(programId),
      'name': serializer.toJson<String>(name),
      'weeks': serializer.toJson<int>(weeks),
      'type': serializer.toJson<int>(
        $ProgramBlocksTableTable.$convertertype.toJson(type),
      ),
    };
  }

  ProgramBlockModel copyWith({
    String? id,
    String? programId,
    String? name,
    int? weeks,
    BlockType? type,
  }) => ProgramBlockModel(
    id: id ?? this.id,
    programId: programId ?? this.programId,
    name: name ?? this.name,
    weeks: weeks ?? this.weeks,
    type: type ?? this.type,
  );
  ProgramBlockModel copyWithCompanion(ProgramBlocksTableCompanion data) {
    return ProgramBlockModel(
      id: data.id.present ? data.id.value : this.id,
      programId: data.programId.present ? data.programId.value : this.programId,
      name: data.name.present ? data.name.value : this.name,
      weeks: data.weeks.present ? data.weeks.value : this.weeks,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramBlockModel(')
          ..write('id: $id, ')
          ..write('programId: $programId, ')
          ..write('name: $name, ')
          ..write('weeks: $weeks, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, programId, name, weeks, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramBlockModel &&
          other.id == this.id &&
          other.programId == this.programId &&
          other.name == this.name &&
          other.weeks == this.weeks &&
          other.type == this.type);
}

class ProgramBlocksTableCompanion extends UpdateCompanion<ProgramBlockModel> {
  final Value<String> id;
  final Value<String> programId;
  final Value<String> name;
  final Value<int> weeks;
  final Value<BlockType> type;
  final Value<int> rowid;
  const ProgramBlocksTableCompanion({
    this.id = const Value.absent(),
    this.programId = const Value.absent(),
    this.name = const Value.absent(),
    this.weeks = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramBlocksTableCompanion.insert({
    required String id,
    required String programId,
    required String name,
    required int weeks,
    required BlockType type,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       programId = Value(programId),
       name = Value(name),
       weeks = Value(weeks),
       type = Value(type);
  static Insertable<ProgramBlockModel> custom({
    Expression<String>? id,
    Expression<String>? programId,
    Expression<String>? name,
    Expression<int>? weeks,
    Expression<int>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (programId != null) 'program_id': programId,
      if (name != null) 'name': name,
      if (weeks != null) 'weeks': weeks,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramBlocksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? programId,
    Value<String>? name,
    Value<int>? weeks,
    Value<BlockType>? type,
    Value<int>? rowid,
  }) {
    return ProgramBlocksTableCompanion(
      id: id ?? this.id,
      programId: programId ?? this.programId,
      name: name ?? this.name,
      weeks: weeks ?? this.weeks,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (programId.present) {
      map['program_id'] = Variable<String>(programId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weeks.present) {
      map['weeks'] = Variable<int>(weeks.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $ProgramBlocksTableTable.$convertertype.toSql(type.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramBlocksTableCompanion(')
          ..write('id: $id, ')
          ..write('programId: $programId, ')
          ..write('name: $name, ')
          ..write('weeks: $weeks, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramSessionsTableTable extends ProgramSessionsTable
    with TableInfo<$ProgramSessionsTableTable, ProgramSessionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockIdMeta = const VerificationMeta(
    'blockId',
  );
  @override
  late final GeneratedColumn<String> blockId = GeneratedColumn<String>(
    'block_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES program_blocks_table (id)',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedDurationMinutesMeta =
      const VerificationMeta('estimatedDurationMinutes');
  @override
  late final GeneratedColumn<int> estimatedDurationMinutes =
      GeneratedColumn<int>(
        'estimated_duration_minutes',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    blockId,
    dayOfWeek,
    name,
    estimatedDurationMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramSessionModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('block_id')) {
      context.handle(
        _blockIdMeta,
        blockId.isAcceptableOrUnknown(data['block_id']!, _blockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_blockIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('estimated_duration_minutes')) {
      context.handle(
        _estimatedDurationMinutesMeta,
        estimatedDurationMinutes.isAcceptableOrUnknown(
          data['estimated_duration_minutes']!,
          _estimatedDurationMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedDurationMinutesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramSessionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramSessionModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      blockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      estimatedDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_duration_minutes'],
      )!,
    );
  }

  @override
  $ProgramSessionsTableTable createAlias(String alias) {
    return $ProgramSessionsTableTable(attachedDatabase, alias);
  }
}

class ProgramSessionModel extends DataClass
    implements Insertable<ProgramSessionModel> {
  final String id;
  final String blockId;
  final int dayOfWeek;
  final String name;
  final int estimatedDurationMinutes;
  const ProgramSessionModel({
    required this.id,
    required this.blockId,
    required this.dayOfWeek,
    required this.name,
    required this.estimatedDurationMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['block_id'] = Variable<String>(blockId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['name'] = Variable<String>(name);
    map['estimated_duration_minutes'] = Variable<int>(estimatedDurationMinutes);
    return map;
  }

  ProgramSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return ProgramSessionsTableCompanion(
      id: Value(id),
      blockId: Value(blockId),
      dayOfWeek: Value(dayOfWeek),
      name: Value(name),
      estimatedDurationMinutes: Value(estimatedDurationMinutes),
    );
  }

  factory ProgramSessionModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramSessionModel(
      id: serializer.fromJson<String>(json['id']),
      blockId: serializer.fromJson<String>(json['blockId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      name: serializer.fromJson<String>(json['name']),
      estimatedDurationMinutes: serializer.fromJson<int>(
        json['estimatedDurationMinutes'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'blockId': serializer.toJson<String>(blockId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'name': serializer.toJson<String>(name),
      'estimatedDurationMinutes': serializer.toJson<int>(
        estimatedDurationMinutes,
      ),
    };
  }

  ProgramSessionModel copyWith({
    String? id,
    String? blockId,
    int? dayOfWeek,
    String? name,
    int? estimatedDurationMinutes,
  }) => ProgramSessionModel(
    id: id ?? this.id,
    blockId: blockId ?? this.blockId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    name: name ?? this.name,
    estimatedDurationMinutes:
        estimatedDurationMinutes ?? this.estimatedDurationMinutes,
  );
  ProgramSessionModel copyWithCompanion(ProgramSessionsTableCompanion data) {
    return ProgramSessionModel(
      id: data.id.present ? data.id.value : this.id,
      blockId: data.blockId.present ? data.blockId.value : this.blockId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      name: data.name.present ? data.name.value : this.name,
      estimatedDurationMinutes: data.estimatedDurationMinutes.present
          ? data.estimatedDurationMinutes.value
          : this.estimatedDurationMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramSessionModel(')
          ..write('id: $id, ')
          ..write('blockId: $blockId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('name: $name, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, blockId, dayOfWeek, name, estimatedDurationMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramSessionModel &&
          other.id == this.id &&
          other.blockId == this.blockId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.name == this.name &&
          other.estimatedDurationMinutes == this.estimatedDurationMinutes);
}

class ProgramSessionsTableCompanion
    extends UpdateCompanion<ProgramSessionModel> {
  final Value<String> id;
  final Value<String> blockId;
  final Value<int> dayOfWeek;
  final Value<String> name;
  final Value<int> estimatedDurationMinutes;
  final Value<int> rowid;
  const ProgramSessionsTableCompanion({
    this.id = const Value.absent(),
    this.blockId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.name = const Value.absent(),
    this.estimatedDurationMinutes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramSessionsTableCompanion.insert({
    required String id,
    required String blockId,
    required int dayOfWeek,
    required String name,
    required int estimatedDurationMinutes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       blockId = Value(blockId),
       dayOfWeek = Value(dayOfWeek),
       name = Value(name),
       estimatedDurationMinutes = Value(estimatedDurationMinutes);
  static Insertable<ProgramSessionModel> custom({
    Expression<String>? id,
    Expression<String>? blockId,
    Expression<int>? dayOfWeek,
    Expression<String>? name,
    Expression<int>? estimatedDurationMinutes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (blockId != null) 'block_id': blockId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (name != null) 'name': name,
      if (estimatedDurationMinutes != null)
        'estimated_duration_minutes': estimatedDurationMinutes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramSessionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? blockId,
    Value<int>? dayOfWeek,
    Value<String>? name,
    Value<int>? estimatedDurationMinutes,
    Value<int>? rowid,
  }) {
    return ProgramSessionsTableCompanion(
      id: id ?? this.id,
      blockId: blockId ?? this.blockId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      name: name ?? this.name,
      estimatedDurationMinutes:
          estimatedDurationMinutes ?? this.estimatedDurationMinutes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (blockId.present) {
      map['block_id'] = Variable<String>(blockId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (estimatedDurationMinutes.present) {
      map['estimated_duration_minutes'] = Variable<int>(
        estimatedDurationMinutes.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('blockId: $blockId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('name: $name, ')
          ..write('estimatedDurationMinutes: $estimatedDurationMinutes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramExercisesTableTable extends ProgramExercisesTable
    with TableInfo<$ProgramExercisesTableTable, ProgramExerciseModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramExercisesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES program_sessions_table (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseNameMeta = const VerificationMeta(
    'exerciseName',
  );
  @override
  late final GeneratedColumn<String> exerciseName = GeneratedColumn<String>(
    'exercise_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repMinMeta = const VerificationMeta('repMin');
  @override
  late final GeneratedColumn<int> repMin = GeneratedColumn<int>(
    'rep_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repMaxMeta = const VerificationMeta('repMax');
  @override
  late final GeneratedColumn<int> repMax = GeneratedColumn<int>(
    'rep_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rirTargetMeta = const VerificationMeta(
    'rirTarget',
  );
  @override
  late final GeneratedColumn<int> rirTarget = GeneratedColumn<int>(
    'rir_target',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restSecondsMeta = const VerificationMeta(
    'restSeconds',
  );
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
    'rest_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _allowedSetTypesStrMeta =
      const VerificationMeta('allowedSetTypesStr');
  @override
  late final GeneratedColumn<String> allowedSetTypesStr =
      GeneratedColumn<String>(
        'allowed_set_types_str',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('0'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    exerciseId,
    exerciseName,
    sets,
    repMin,
    repMax,
    rirTarget,
    restSeconds,
    allowedSetTypesStr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'program_exercises_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgramExerciseModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('exercise_name')) {
      context.handle(
        _exerciseNameMeta,
        exerciseName.isAcceptableOrUnknown(
          data['exercise_name']!,
          _exerciseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseNameMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    } else if (isInserting) {
      context.missing(_setsMeta);
    }
    if (data.containsKey('rep_min')) {
      context.handle(
        _repMinMeta,
        repMin.isAcceptableOrUnknown(data['rep_min']!, _repMinMeta),
      );
    } else if (isInserting) {
      context.missing(_repMinMeta);
    }
    if (data.containsKey('rep_max')) {
      context.handle(
        _repMaxMeta,
        repMax.isAcceptableOrUnknown(data['rep_max']!, _repMaxMeta),
      );
    } else if (isInserting) {
      context.missing(_repMaxMeta);
    }
    if (data.containsKey('rir_target')) {
      context.handle(
        _rirTargetMeta,
        rirTarget.isAcceptableOrUnknown(data['rir_target']!, _rirTargetMeta),
      );
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
        _restSecondsMeta,
        restSeconds.isAcceptableOrUnknown(
          data['rest_seconds']!,
          _restSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_restSecondsMeta);
    }
    if (data.containsKey('allowed_set_types_str')) {
      context.handle(
        _allowedSetTypesStrMeta,
        allowedSetTypesStr.isAcceptableOrUnknown(
          data['allowed_set_types_str']!,
          _allowedSetTypesStrMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramExerciseModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgramExerciseModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      exerciseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_name'],
      )!,
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      )!,
      repMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rep_min'],
      )!,
      repMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rep_max'],
      )!,
      rirTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rir_target'],
      ),
      restSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_seconds'],
      )!,
      allowedSetTypesStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allowed_set_types_str'],
      )!,
    );
  }

  @override
  $ProgramExercisesTableTable createAlias(String alias) {
    return $ProgramExercisesTableTable(attachedDatabase, alias);
  }
}

class ProgramExerciseModel extends DataClass
    implements Insertable<ProgramExerciseModel> {
  final String id;
  final String sessionId;
  final String exerciseId;
  final String exerciseName;
  final int sets;
  final int repMin;
  final int repMax;
  final int? rirTarget;
  final int restSeconds;
  final String allowedSetTypesStr;
  const ProgramExerciseModel({
    required this.id,
    required this.sessionId,
    required this.exerciseId,
    required this.exerciseName,
    required this.sets,
    required this.repMin,
    required this.repMax,
    this.rirTarget,
    required this.restSeconds,
    required this.allowedSetTypesStr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['exercise_name'] = Variable<String>(exerciseName);
    map['sets'] = Variable<int>(sets);
    map['rep_min'] = Variable<int>(repMin);
    map['rep_max'] = Variable<int>(repMax);
    if (!nullToAbsent || rirTarget != null) {
      map['rir_target'] = Variable<int>(rirTarget);
    }
    map['rest_seconds'] = Variable<int>(restSeconds);
    map['allowed_set_types_str'] = Variable<String>(allowedSetTypesStr);
    return map;
  }

  ProgramExercisesTableCompanion toCompanion(bool nullToAbsent) {
    return ProgramExercisesTableCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      exerciseId: Value(exerciseId),
      exerciseName: Value(exerciseName),
      sets: Value(sets),
      repMin: Value(repMin),
      repMax: Value(repMax),
      rirTarget: rirTarget == null && nullToAbsent
          ? const Value.absent()
          : Value(rirTarget),
      restSeconds: Value(restSeconds),
      allowedSetTypesStr: Value(allowedSetTypesStr),
    );
  }

  factory ProgramExerciseModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgramExerciseModel(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      exerciseName: serializer.fromJson<String>(json['exerciseName']),
      sets: serializer.fromJson<int>(json['sets']),
      repMin: serializer.fromJson<int>(json['repMin']),
      repMax: serializer.fromJson<int>(json['repMax']),
      rirTarget: serializer.fromJson<int?>(json['rirTarget']),
      restSeconds: serializer.fromJson<int>(json['restSeconds']),
      allowedSetTypesStr: serializer.fromJson<String>(
        json['allowedSetTypesStr'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'exerciseName': serializer.toJson<String>(exerciseName),
      'sets': serializer.toJson<int>(sets),
      'repMin': serializer.toJson<int>(repMin),
      'repMax': serializer.toJson<int>(repMax),
      'rirTarget': serializer.toJson<int?>(rirTarget),
      'restSeconds': serializer.toJson<int>(restSeconds),
      'allowedSetTypesStr': serializer.toJson<String>(allowedSetTypesStr),
    };
  }

  ProgramExerciseModel copyWith({
    String? id,
    String? sessionId,
    String? exerciseId,
    String? exerciseName,
    int? sets,
    int? repMin,
    int? repMax,
    Value<int?> rirTarget = const Value.absent(),
    int? restSeconds,
    String? allowedSetTypesStr,
  }) => ProgramExerciseModel(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    exerciseId: exerciseId ?? this.exerciseId,
    exerciseName: exerciseName ?? this.exerciseName,
    sets: sets ?? this.sets,
    repMin: repMin ?? this.repMin,
    repMax: repMax ?? this.repMax,
    rirTarget: rirTarget.present ? rirTarget.value : this.rirTarget,
    restSeconds: restSeconds ?? this.restSeconds,
    allowedSetTypesStr: allowedSetTypesStr ?? this.allowedSetTypesStr,
  );
  ProgramExerciseModel copyWithCompanion(ProgramExercisesTableCompanion data) {
    return ProgramExerciseModel(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      exerciseName: data.exerciseName.present
          ? data.exerciseName.value
          : this.exerciseName,
      sets: data.sets.present ? data.sets.value : this.sets,
      repMin: data.repMin.present ? data.repMin.value : this.repMin,
      repMax: data.repMax.present ? data.repMax.value : this.repMax,
      rirTarget: data.rirTarget.present ? data.rirTarget.value : this.rirTarget,
      restSeconds: data.restSeconds.present
          ? data.restSeconds.value
          : this.restSeconds,
      allowedSetTypesStr: data.allowedSetTypesStr.present
          ? data.allowedSetTypesStr.value
          : this.allowedSetTypesStr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgramExerciseModel(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('sets: $sets, ')
          ..write('repMin: $repMin, ')
          ..write('repMax: $repMax, ')
          ..write('rirTarget: $rirTarget, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('allowedSetTypesStr: $allowedSetTypesStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    exerciseId,
    exerciseName,
    sets,
    repMin,
    repMax,
    rirTarget,
    restSeconds,
    allowedSetTypesStr,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgramExerciseModel &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.exerciseName == this.exerciseName &&
          other.sets == this.sets &&
          other.repMin == this.repMin &&
          other.repMax == this.repMax &&
          other.rirTarget == this.rirTarget &&
          other.restSeconds == this.restSeconds &&
          other.allowedSetTypesStr == this.allowedSetTypesStr);
}

class ProgramExercisesTableCompanion
    extends UpdateCompanion<ProgramExerciseModel> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> exerciseId;
  final Value<String> exerciseName;
  final Value<int> sets;
  final Value<int> repMin;
  final Value<int> repMax;
  final Value<int?> rirTarget;
  final Value<int> restSeconds;
  final Value<String> allowedSetTypesStr;
  final Value<int> rowid;
  const ProgramExercisesTableCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.exerciseName = const Value.absent(),
    this.sets = const Value.absent(),
    this.repMin = const Value.absent(),
    this.repMax = const Value.absent(),
    this.rirTarget = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.allowedSetTypesStr = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramExercisesTableCompanion.insert({
    required String id,
    required String sessionId,
    required String exerciseId,
    required String exerciseName,
    required int sets,
    required int repMin,
    required int repMax,
    this.rirTarget = const Value.absent(),
    required int restSeconds,
    this.allowedSetTypesStr = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       exerciseId = Value(exerciseId),
       exerciseName = Value(exerciseName),
       sets = Value(sets),
       repMin = Value(repMin),
       repMax = Value(repMax),
       restSeconds = Value(restSeconds);
  static Insertable<ProgramExerciseModel> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? exerciseId,
    Expression<String>? exerciseName,
    Expression<int>? sets,
    Expression<int>? repMin,
    Expression<int>? repMax,
    Expression<int>? rirTarget,
    Expression<int>? restSeconds,
    Expression<String>? allowedSetTypesStr,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (exerciseName != null) 'exercise_name': exerciseName,
      if (sets != null) 'sets': sets,
      if (repMin != null) 'rep_min': repMin,
      if (repMax != null) 'rep_max': repMax,
      if (rirTarget != null) 'rir_target': rirTarget,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (allowedSetTypesStr != null)
        'allowed_set_types_str': allowedSetTypesStr,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramExercisesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? exerciseId,
    Value<String>? exerciseName,
    Value<int>? sets,
    Value<int>? repMin,
    Value<int>? repMax,
    Value<int?>? rirTarget,
    Value<int>? restSeconds,
    Value<String>? allowedSetTypesStr,
    Value<int>? rowid,
  }) {
    return ProgramExercisesTableCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      exerciseName: exerciseName ?? this.exerciseName,
      sets: sets ?? this.sets,
      repMin: repMin ?? this.repMin,
      repMax: repMax ?? this.repMax,
      rirTarget: rirTarget ?? this.rirTarget,
      restSeconds: restSeconds ?? this.restSeconds,
      allowedSetTypesStr: allowedSetTypesStr ?? this.allowedSetTypesStr,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (exerciseName.present) {
      map['exercise_name'] = Variable<String>(exerciseName.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (repMin.present) {
      map['rep_min'] = Variable<int>(repMin.value);
    }
    if (repMax.present) {
      map['rep_max'] = Variable<int>(repMax.value);
    }
    if (rirTarget.present) {
      map['rir_target'] = Variable<int>(rirTarget.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (allowedSetTypesStr.present) {
      map['allowed_set_types_str'] = Variable<String>(allowedSetTypesStr.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramExercisesTableCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('exerciseName: $exerciseName, ')
          ..write('sets: $sets, ')
          ..write('repMin: $repMin, ')
          ..write('repMax: $repMax, ')
          ..write('rirTarget: $rirTarget, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('allowedSetTypesStr: $allowedSetTypesStr, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BodyWeightEntriesTableTable extends BodyWeightEntriesTable
    with TableInfo<$BodyWeightEntriesTableTable, BodyWeightEntryModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyWeightEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, weightKg, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_weight_entries_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyWeightEntryModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyWeightEntryModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyWeightEntryModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $BodyWeightEntriesTableTable createAlias(String alias) {
    return $BodyWeightEntriesTableTable(attachedDatabase, alias);
  }
}

class BodyWeightEntryModel extends DataClass
    implements Insertable<BodyWeightEntryModel> {
  final String id;
  final double weightKg;
  final DateTime date;
  const BodyWeightEntryModel({
    required this.id,
    required this.weightKg,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['weight_kg'] = Variable<double>(weightKg);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  BodyWeightEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return BodyWeightEntriesTableCompanion(
      id: Value(id),
      weightKg: Value(weightKg),
      date: Value(date),
    );
  }

  factory BodyWeightEntryModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyWeightEntryModel(
      id: serializer.fromJson<String>(json['id']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'weightKg': serializer.toJson<double>(weightKg),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  BodyWeightEntryModel copyWith({
    String? id,
    double? weightKg,
    DateTime? date,
  }) => BodyWeightEntryModel(
    id: id ?? this.id,
    weightKg: weightKg ?? this.weightKg,
    date: date ?? this.date,
  );
  BodyWeightEntryModel copyWithCompanion(BodyWeightEntriesTableCompanion data) {
    return BodyWeightEntryModel(
      id: data.id.present ? data.id.value : this.id,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyWeightEntryModel(')
          ..write('id: $id, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weightKg, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyWeightEntryModel &&
          other.id == this.id &&
          other.weightKg == this.weightKg &&
          other.date == this.date);
}

class BodyWeightEntriesTableCompanion
    extends UpdateCompanion<BodyWeightEntryModel> {
  final Value<String> id;
  final Value<double> weightKg;
  final Value<DateTime> date;
  final Value<int> rowid;
  const BodyWeightEntriesTableCompanion({
    this.id = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyWeightEntriesTableCompanion.insert({
    required String id,
    required double weightKg,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       weightKg = Value(weightKg),
       date = Value(date);
  static Insertable<BodyWeightEntryModel> custom({
    Expression<String>? id,
    Expression<double>? weightKg,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weightKg != null) 'weight_kg': weightKg,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyWeightEntriesTableCompanion copyWith({
    Value<String>? id,
    Value<double>? weightKg,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return BodyWeightEntriesTableCompanion(
      id: id ?? this.id,
      weightKg: weightKg ?? this.weightKg,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyWeightEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('weightKg: $weightKg, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BodyMeasurementsTableTable extends BodyMeasurementsTable
    with TableInfo<$BodyMeasurementsTableTable, BodyMeasurementModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MeasurementType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<MeasurementType>(
        $BodyMeasurementsTableTable.$convertertype,
      );
  static const VerificationMeta _valueCmMeta = const VerificationMeta(
    'valueCm',
  );
  @override
  late final GeneratedColumn<double> valueCm = GeneratedColumn<double>(
    'value_cm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, valueCm, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyMeasurementModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value_cm')) {
      context.handle(
        _valueCmMeta,
        valueCm.isAcceptableOrUnknown(data['value_cm']!, _valueCmMeta),
      );
    } else if (isInserting) {
      context.missing(_valueCmMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurementModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurementModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: $BodyMeasurementsTableTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      valueCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value_cm'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $BodyMeasurementsTableTable createAlias(String alias) {
    return $BodyMeasurementsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MeasurementType, int, int> $convertertype =
      const EnumIndexConverter<MeasurementType>(MeasurementType.values);
}

class BodyMeasurementModel extends DataClass
    implements Insertable<BodyMeasurementModel> {
  final String id;
  final MeasurementType type;
  final double valueCm;
  final DateTime date;
  const BodyMeasurementModel({
    required this.id,
    required this.type,
    required this.valueCm,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['type'] = Variable<int>(
        $BodyMeasurementsTableTable.$convertertype.toSql(type),
      );
    }
    map['value_cm'] = Variable<double>(valueCm);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  BodyMeasurementsTableCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsTableCompanion(
      id: Value(id),
      type: Value(type),
      valueCm: Value(valueCm),
      date: Value(date),
    );
  }

  factory BodyMeasurementModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurementModel(
      id: serializer.fromJson<String>(json['id']),
      type: $BodyMeasurementsTableTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      valueCm: serializer.fromJson<double>(json['valueCm']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<int>(
        $BodyMeasurementsTableTable.$convertertype.toJson(type),
      ),
      'valueCm': serializer.toJson<double>(valueCm),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  BodyMeasurementModel copyWith({
    String? id,
    MeasurementType? type,
    double? valueCm,
    DateTime? date,
  }) => BodyMeasurementModel(
    id: id ?? this.id,
    type: type ?? this.type,
    valueCm: valueCm ?? this.valueCm,
    date: date ?? this.date,
  );
  BodyMeasurementModel copyWithCompanion(BodyMeasurementsTableCompanion data) {
    return BodyMeasurementModel(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      valueCm: data.valueCm.present ? data.valueCm.value : this.valueCm,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementModel(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('valueCm: $valueCm, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, valueCm, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurementModel &&
          other.id == this.id &&
          other.type == this.type &&
          other.valueCm == this.valueCm &&
          other.date == this.date);
}

class BodyMeasurementsTableCompanion
    extends UpdateCompanion<BodyMeasurementModel> {
  final Value<String> id;
  final Value<MeasurementType> type;
  final Value<double> valueCm;
  final Value<DateTime> date;
  final Value<int> rowid;
  const BodyMeasurementsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.valueCm = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyMeasurementsTableCompanion.insert({
    required String id,
    required MeasurementType type,
    required double valueCm,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       valueCm = Value(valueCm),
       date = Value(date);
  static Insertable<BodyMeasurementModel> custom({
    Expression<String>? id,
    Expression<int>? type,
    Expression<double>? valueCm,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (valueCm != null) 'value_cm': valueCm,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyMeasurementsTableCompanion copyWith({
    Value<String>? id,
    Value<MeasurementType>? type,
    Value<double>? valueCm,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return BodyMeasurementsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      valueCm: valueCm ?? this.valueCm,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $BodyMeasurementsTableTable.$convertertype.toSql(type.value),
      );
    }
    if (valueCm.present) {
      map['value_cm'] = Variable<double>(valueCm.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('valueCm: $valueCm, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GymProfilesTableTable extends GymProfilesTable
    with TableInfo<$GymProfilesTableTable, GymProfileModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GymProfilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barWeightKgMeta = const VerificationMeta(
    'barWeightKg',
  );
  @override
  late final GeneratedColumn<double> barWeightKg = GeneratedColumn<double>(
    'bar_weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _availablePlatesKgStrMeta =
      const VerificationMeta('availablePlatesKgStr');
  @override
  late final GeneratedColumn<String> availablePlatesKgStr =
      GeneratedColumn<String>(
        'available_plates_kg_str',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    barWeightKg,
    availablePlatesKgStr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gym_profiles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GymProfileModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bar_weight_kg')) {
      context.handle(
        _barWeightKgMeta,
        barWeightKg.isAcceptableOrUnknown(
          data['bar_weight_kg']!,
          _barWeightKgMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_barWeightKgMeta);
    }
    if (data.containsKey('available_plates_kg_str')) {
      context.handle(
        _availablePlatesKgStrMeta,
        availablePlatesKgStr.isAcceptableOrUnknown(
          data['available_plates_kg_str']!,
          _availablePlatesKgStrMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_availablePlatesKgStrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GymProfileModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GymProfileModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      barWeightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bar_weight_kg'],
      )!,
      availablePlatesKgStr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}available_plates_kg_str'],
      )!,
    );
  }

  @override
  $GymProfilesTableTable createAlias(String alias) {
    return $GymProfilesTableTable(attachedDatabase, alias);
  }
}

class GymProfileModel extends DataClass implements Insertable<GymProfileModel> {
  final String id;
  final String name;
  final double barWeightKg;
  final String availablePlatesKgStr;
  const GymProfileModel({
    required this.id,
    required this.name,
    required this.barWeightKg,
    required this.availablePlatesKgStr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['bar_weight_kg'] = Variable<double>(barWeightKg);
    map['available_plates_kg_str'] = Variable<String>(availablePlatesKgStr);
    return map;
  }

  GymProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return GymProfilesTableCompanion(
      id: Value(id),
      name: Value(name),
      barWeightKg: Value(barWeightKg),
      availablePlatesKgStr: Value(availablePlatesKgStr),
    );
  }

  factory GymProfileModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GymProfileModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      barWeightKg: serializer.fromJson<double>(json['barWeightKg']),
      availablePlatesKgStr: serializer.fromJson<String>(
        json['availablePlatesKgStr'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'barWeightKg': serializer.toJson<double>(barWeightKg),
      'availablePlatesKgStr': serializer.toJson<String>(availablePlatesKgStr),
    };
  }

  GymProfileModel copyWith({
    String? id,
    String? name,
    double? barWeightKg,
    String? availablePlatesKgStr,
  }) => GymProfileModel(
    id: id ?? this.id,
    name: name ?? this.name,
    barWeightKg: barWeightKg ?? this.barWeightKg,
    availablePlatesKgStr: availablePlatesKgStr ?? this.availablePlatesKgStr,
  );
  GymProfileModel copyWithCompanion(GymProfilesTableCompanion data) {
    return GymProfileModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      barWeightKg: data.barWeightKg.present
          ? data.barWeightKg.value
          : this.barWeightKg,
      availablePlatesKgStr: data.availablePlatesKgStr.present
          ? data.availablePlatesKgStr.value
          : this.availablePlatesKgStr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GymProfileModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('barWeightKg: $barWeightKg, ')
          ..write('availablePlatesKgStr: $availablePlatesKgStr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, barWeightKg, availablePlatesKgStr);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GymProfileModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.barWeightKg == this.barWeightKg &&
          other.availablePlatesKgStr == this.availablePlatesKgStr);
}

class GymProfilesTableCompanion extends UpdateCompanion<GymProfileModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> barWeightKg;
  final Value<String> availablePlatesKgStr;
  final Value<int> rowid;
  const GymProfilesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.barWeightKg = const Value.absent(),
    this.availablePlatesKgStr = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GymProfilesTableCompanion.insert({
    required String id,
    required String name,
    required double barWeightKg,
    required String availablePlatesKgStr,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       barWeightKg = Value(barWeightKg),
       availablePlatesKgStr = Value(availablePlatesKgStr);
  static Insertable<GymProfileModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? barWeightKg,
    Expression<String>? availablePlatesKgStr,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (barWeightKg != null) 'bar_weight_kg': barWeightKg,
      if (availablePlatesKgStr != null)
        'available_plates_kg_str': availablePlatesKgStr,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GymProfilesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? barWeightKg,
    Value<String>? availablePlatesKgStr,
    Value<int>? rowid,
  }) {
    return GymProfilesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      barWeightKg: barWeightKg ?? this.barWeightKg,
      availablePlatesKgStr: availablePlatesKgStr ?? this.availablePlatesKgStr,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (barWeightKg.present) {
      map['bar_weight_kg'] = Variable<double>(barWeightKg.value);
    }
    if (availablePlatesKgStr.present) {
      map['available_plates_kg_str'] = Variable<String>(
        availablePlatesKgStr.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GymProfilesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('barWeightKg: $barWeightKg, ')
          ..write('availablePlatesKgStr: $availablePlatesKgStr, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTableTable extends UserProfilesTable
    with TableInfo<$UserProfilesTableTable, UserProfileModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Goal, int> goal =
      GeneratedColumn<int>(
        'goal',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Goal>($UserProfilesTableTable.$convertergoal);
  @override
  late final GeneratedColumnWithTypeConverter<ExperienceLevel, int> experience =
      GeneratedColumn<int>(
        'experience',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<ExperienceLevel>(
        $UserProfilesTableTable.$converterexperience,
      );
  static const VerificationMeta _trainingDaysPerWeekMeta =
      const VerificationMeta('trainingDaysPerWeek');
  @override
  late final GeneratedColumn<int> trainingDaysPerWeek = GeneratedColumn<int>(
    'training_days_per_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionDurationMinutesMeta =
      const VerificationMeta('sessionDurationMinutes');
  @override
  late final GeneratedColumn<int> sessionDurationMinutes = GeneratedColumn<int>(
    'session_duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WeightUnit, int> unit =
      GeneratedColumn<int>(
        'unit',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<WeightUnit>($UserProfilesTableTable.$converterunit);
  static const VerificationMeta _activeGymProfileIdMeta =
      const VerificationMeta('activeGymProfileId');
  @override
  late final GeneratedColumn<String> activeGymProfileId =
      GeneratedColumn<String>(
        'active_gym_profile_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    goal,
    experience,
    trainingDaysPerWeek,
    sessionDurationMinutes,
    unit,
    activeGymProfileId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('training_days_per_week')) {
      context.handle(
        _trainingDaysPerWeekMeta,
        trainingDaysPerWeek.isAcceptableOrUnknown(
          data['training_days_per_week']!,
          _trainingDaysPerWeekMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trainingDaysPerWeekMeta);
    }
    if (data.containsKey('session_duration_minutes')) {
      context.handle(
        _sessionDurationMinutesMeta,
        sessionDurationMinutes.isAcceptableOrUnknown(
          data['session_duration_minutes']!,
          _sessionDurationMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionDurationMinutesMeta);
    }
    if (data.containsKey('active_gym_profile_id')) {
      context.handle(
        _activeGymProfileIdMeta,
        activeGymProfileId.isAcceptableOrUnknown(
          data['active_gym_profile_id']!,
          _activeGymProfileIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activeGymProfileIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      goal: $UserProfilesTableTable.$convertergoal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}goal'],
        )!,
      ),
      experience: $UserProfilesTableTable.$converterexperience.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}experience'],
        )!,
      ),
      trainingDaysPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}training_days_per_week'],
      )!,
      sessionDurationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_duration_minutes'],
      )!,
      unit: $UserProfilesTableTable.$converterunit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}unit'],
        )!,
      ),
      activeGymProfileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_gym_profile_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserProfilesTableTable createAlias(String alias) {
    return $UserProfilesTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Goal, int, int> $convertergoal =
      const EnumIndexConverter<Goal>(Goal.values);
  static JsonTypeConverter2<ExperienceLevel, int, int> $converterexperience =
      const EnumIndexConverter<ExperienceLevel>(ExperienceLevel.values);
  static JsonTypeConverter2<WeightUnit, int, int> $converterunit =
      const EnumIndexConverter<WeightUnit>(WeightUnit.values);
}

class UserProfileModel extends DataClass
    implements Insertable<UserProfileModel> {
  final String id;
  final String email;
  final Goal goal;
  final ExperienceLevel experience;
  final int trainingDaysPerWeek;
  final int sessionDurationMinutes;
  final WeightUnit unit;
  final String activeGymProfileId;
  final DateTime createdAt;
  const UserProfileModel({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    {
      map['goal'] = Variable<int>(
        $UserProfilesTableTable.$convertergoal.toSql(goal),
      );
    }
    {
      map['experience'] = Variable<int>(
        $UserProfilesTableTable.$converterexperience.toSql(experience),
      );
    }
    map['training_days_per_week'] = Variable<int>(trainingDaysPerWeek);
    map['session_duration_minutes'] = Variable<int>(sessionDurationMinutes);
    {
      map['unit'] = Variable<int>(
        $UserProfilesTableTable.$converterunit.toSql(unit),
      );
    }
    map['active_gym_profile_id'] = Variable<String>(activeGymProfileId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserProfilesTableCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesTableCompanion(
      id: Value(id),
      email: Value(email),
      goal: Value(goal),
      experience: Value(experience),
      trainingDaysPerWeek: Value(trainingDaysPerWeek),
      sessionDurationMinutes: Value(sessionDurationMinutes),
      unit: Value(unit),
      activeGymProfileId: Value(activeGymProfileId),
      createdAt: Value(createdAt),
    );
  }

  factory UserProfileModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileModel(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      goal: $UserProfilesTableTable.$convertergoal.fromJson(
        serializer.fromJson<int>(json['goal']),
      ),
      experience: $UserProfilesTableTable.$converterexperience.fromJson(
        serializer.fromJson<int>(json['experience']),
      ),
      trainingDaysPerWeek: serializer.fromJson<int>(
        json['trainingDaysPerWeek'],
      ),
      sessionDurationMinutes: serializer.fromJson<int>(
        json['sessionDurationMinutes'],
      ),
      unit: $UserProfilesTableTable.$converterunit.fromJson(
        serializer.fromJson<int>(json['unit']),
      ),
      activeGymProfileId: serializer.fromJson<String>(
        json['activeGymProfileId'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'goal': serializer.toJson<int>(
        $UserProfilesTableTable.$convertergoal.toJson(goal),
      ),
      'experience': serializer.toJson<int>(
        $UserProfilesTableTable.$converterexperience.toJson(experience),
      ),
      'trainingDaysPerWeek': serializer.toJson<int>(trainingDaysPerWeek),
      'sessionDurationMinutes': serializer.toJson<int>(sessionDurationMinutes),
      'unit': serializer.toJson<int>(
        $UserProfilesTableTable.$converterunit.toJson(unit),
      ),
      'activeGymProfileId': serializer.toJson<String>(activeGymProfileId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserProfileModel copyWith({
    String? id,
    String? email,
    Goal? goal,
    ExperienceLevel? experience,
    int? trainingDaysPerWeek,
    int? sessionDurationMinutes,
    WeightUnit? unit,
    String? activeGymProfileId,
    DateTime? createdAt,
  }) => UserProfileModel(
    id: id ?? this.id,
    email: email ?? this.email,
    goal: goal ?? this.goal,
    experience: experience ?? this.experience,
    trainingDaysPerWeek: trainingDaysPerWeek ?? this.trainingDaysPerWeek,
    sessionDurationMinutes:
        sessionDurationMinutes ?? this.sessionDurationMinutes,
    unit: unit ?? this.unit,
    activeGymProfileId: activeGymProfileId ?? this.activeGymProfileId,
    createdAt: createdAt ?? this.createdAt,
  );
  UserProfileModel copyWithCompanion(UserProfilesTableCompanion data) {
    return UserProfileModel(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      goal: data.goal.present ? data.goal.value : this.goal,
      experience: data.experience.present
          ? data.experience.value
          : this.experience,
      trainingDaysPerWeek: data.trainingDaysPerWeek.present
          ? data.trainingDaysPerWeek.value
          : this.trainingDaysPerWeek,
      sessionDurationMinutes: data.sessionDurationMinutes.present
          ? data.sessionDurationMinutes.value
          : this.sessionDurationMinutes,
      unit: data.unit.present ? data.unit.value : this.unit,
      activeGymProfileId: data.activeGymProfileId.present
          ? data.activeGymProfileId.value
          : this.activeGymProfileId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileModel(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('goal: $goal, ')
          ..write('experience: $experience, ')
          ..write('trainingDaysPerWeek: $trainingDaysPerWeek, ')
          ..write('sessionDurationMinutes: $sessionDurationMinutes, ')
          ..write('unit: $unit, ')
          ..write('activeGymProfileId: $activeGymProfileId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    goal,
    experience,
    trainingDaysPerWeek,
    sessionDurationMinutes,
    unit,
    activeGymProfileId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileModel &&
          other.id == this.id &&
          other.email == this.email &&
          other.goal == this.goal &&
          other.experience == this.experience &&
          other.trainingDaysPerWeek == this.trainingDaysPerWeek &&
          other.sessionDurationMinutes == this.sessionDurationMinutes &&
          other.unit == this.unit &&
          other.activeGymProfileId == this.activeGymProfileId &&
          other.createdAt == this.createdAt);
}

class UserProfilesTableCompanion extends UpdateCompanion<UserProfileModel> {
  final Value<String> id;
  final Value<String> email;
  final Value<Goal> goal;
  final Value<ExperienceLevel> experience;
  final Value<int> trainingDaysPerWeek;
  final Value<int> sessionDurationMinutes;
  final Value<WeightUnit> unit;
  final Value<String> activeGymProfileId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserProfilesTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.goal = const Value.absent(),
    this.experience = const Value.absent(),
    this.trainingDaysPerWeek = const Value.absent(),
    this.sessionDurationMinutes = const Value.absent(),
    this.unit = const Value.absent(),
    this.activeGymProfileId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesTableCompanion.insert({
    required String id,
    required String email,
    required Goal goal,
    required ExperienceLevel experience,
    required int trainingDaysPerWeek,
    required int sessionDurationMinutes,
    required WeightUnit unit,
    required String activeGymProfileId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       email = Value(email),
       goal = Value(goal),
       experience = Value(experience),
       trainingDaysPerWeek = Value(trainingDaysPerWeek),
       sessionDurationMinutes = Value(sessionDurationMinutes),
       unit = Value(unit),
       activeGymProfileId = Value(activeGymProfileId),
       createdAt = Value(createdAt);
  static Insertable<UserProfileModel> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<int>? goal,
    Expression<int>? experience,
    Expression<int>? trainingDaysPerWeek,
    Expression<int>? sessionDurationMinutes,
    Expression<int>? unit,
    Expression<String>? activeGymProfileId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (goal != null) 'goal': goal,
      if (experience != null) 'experience': experience,
      if (trainingDaysPerWeek != null)
        'training_days_per_week': trainingDaysPerWeek,
      if (sessionDurationMinutes != null)
        'session_duration_minutes': sessionDurationMinutes,
      if (unit != null) 'unit': unit,
      if (activeGymProfileId != null)
        'active_gym_profile_id': activeGymProfileId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? email,
    Value<Goal>? goal,
    Value<ExperienceLevel>? experience,
    Value<int>? trainingDaysPerWeek,
    Value<int>? sessionDurationMinutes,
    Value<WeightUnit>? unit,
    Value<String>? activeGymProfileId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UserProfilesTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      goal: goal ?? this.goal,
      experience: experience ?? this.experience,
      trainingDaysPerWeek: trainingDaysPerWeek ?? this.trainingDaysPerWeek,
      sessionDurationMinutes:
          sessionDurationMinutes ?? this.sessionDurationMinutes,
      unit: unit ?? this.unit,
      activeGymProfileId: activeGymProfileId ?? this.activeGymProfileId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (goal.present) {
      map['goal'] = Variable<int>(
        $UserProfilesTableTable.$convertergoal.toSql(goal.value),
      );
    }
    if (experience.present) {
      map['experience'] = Variable<int>(
        $UserProfilesTableTable.$converterexperience.toSql(experience.value),
      );
    }
    if (trainingDaysPerWeek.present) {
      map['training_days_per_week'] = Variable<int>(trainingDaysPerWeek.value);
    }
    if (sessionDurationMinutes.present) {
      map['session_duration_minutes'] = Variable<int>(
        sessionDurationMinutes.value,
      );
    }
    if (unit.present) {
      map['unit'] = Variable<int>(
        $UserProfilesTableTable.$converterunit.toSql(unit.value),
      );
    }
    if (activeGymProfileId.present) {
      map['active_gym_profile_id'] = Variable<String>(activeGymProfileId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('goal: $goal, ')
          ..write('experience: $experience, ')
          ..write('trainingDaysPerWeek: $trainingDaysPerWeek, ')
          ..write('sessionDurationMinutes: $sessionDurationMinutes, ')
          ..write('unit: $unit, ')
          ..write('activeGymProfileId: $activeGymProfileId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExercisesTableTable exercisesTable = $ExercisesTableTable(this);
  late final $WorkoutSessionsTableTable workoutSessionsTable =
      $WorkoutSessionsTableTable(this);
  late final $ExerciseLogsTableTable exerciseLogsTable =
      $ExerciseLogsTableTable(this);
  late final $SetLogsTableTable setLogsTable = $SetLogsTableTable(this);
  late final $ProgramsTableTable programsTable = $ProgramsTableTable(this);
  late final $ProgramBlocksTableTable programBlocksTable =
      $ProgramBlocksTableTable(this);
  late final $ProgramSessionsTableTable programSessionsTable =
      $ProgramSessionsTableTable(this);
  late final $ProgramExercisesTableTable programExercisesTable =
      $ProgramExercisesTableTable(this);
  late final $BodyWeightEntriesTableTable bodyWeightEntriesTable =
      $BodyWeightEntriesTableTable(this);
  late final $BodyMeasurementsTableTable bodyMeasurementsTable =
      $BodyMeasurementsTableTable(this);
  late final $GymProfilesTableTable gymProfilesTable = $GymProfilesTableTable(
    this,
  );
  late final $UserProfilesTableTable userProfilesTable =
      $UserProfilesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    exercisesTable,
    workoutSessionsTable,
    exerciseLogsTable,
    setLogsTable,
    programsTable,
    programBlocksTable,
    programSessionsTable,
    programExercisesTable,
    bodyWeightEntriesTable,
    bodyMeasurementsTable,
    gymProfilesTable,
    userProfilesTable,
  ];
}

typedef $$ExercisesTableTableCreateCompanionBuilder =
    ExercisesTableCompanion Function({
      required String id,
      required String name,
      Value<bool> isCustom,
      Value<int> rowid,
    });
typedef $$ExercisesTableTableUpdateCompanionBuilder =
    ExercisesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<bool> isCustom,
      Value<int> rowid,
    });

class $$ExercisesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTableTable> {
  $$ExercisesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);
}

class $$ExercisesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTableTable,
          ExerciseModel,
          $$ExercisesTableTableFilterComposer,
          $$ExercisesTableTableOrderingComposer,
          $$ExercisesTableTableAnnotationComposer,
          $$ExercisesTableTableCreateCompanionBuilder,
          $$ExercisesTableTableUpdateCompanionBuilder,
          (
            ExerciseModel,
            BaseReferences<_$AppDatabase, $ExercisesTableTable, ExerciseModel>,
          ),
          ExerciseModel,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableTableManager(
    _$AppDatabase db,
    $ExercisesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesTableCompanion(
                id: id,
                name: name,
                isCustom: isCustom,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<bool> isCustom = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesTableCompanion.insert(
                id: id,
                name: name,
                isCustom: isCustom,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTableTable,
      ExerciseModel,
      $$ExercisesTableTableFilterComposer,
      $$ExercisesTableTableOrderingComposer,
      $$ExercisesTableTableAnnotationComposer,
      $$ExercisesTableTableCreateCompanionBuilder,
      $$ExercisesTableTableUpdateCompanionBuilder,
      (
        ExerciseModel,
        BaseReferences<_$AppDatabase, $ExercisesTableTable, ExerciseModel>,
      ),
      ExerciseModel,
      PrefetchHooks Function()
    >;
typedef $$WorkoutSessionsTableTableCreateCompanionBuilder =
    WorkoutSessionsTableCompanion Function({
      required String id,
      Value<String?> programSessionId,
      required String name,
      required DateTime startedAt,
      Value<DateTime?> finishedAt,
      Value<int> durationSeconds,
      Value<double> totalVolumeKg,
      Value<int?> sessionRpe,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$WorkoutSessionsTableTableUpdateCompanionBuilder =
    WorkoutSessionsTableCompanion Function({
      Value<String> id,
      Value<String?> programSessionId,
      Value<String> name,
      Value<DateTime> startedAt,
      Value<DateTime?> finishedAt,
      Value<int> durationSeconds,
      Value<double> totalVolumeKg,
      Value<int?> sessionRpe,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$WorkoutSessionsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WorkoutSessionsTableTable,
          WorkoutSessionModel
        > {
  $$WorkoutSessionsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ExerciseLogsTableTable, List<ExerciseLogModel>>
  _exerciseLogsTableRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.exerciseLogsTable,
    aliasName:
        'workout_sessions_table__id__exercise_logs_table__workout_session_id',
  );

  $$ExerciseLogsTableTableProcessedTableManager get exerciseLogsTableRefs {
    final manager =
        $$ExerciseLogsTableTableTableManager(
          $_db,
          $_db.exerciseLogsTable,
        ).filter(
          (f) => f.workoutSessionId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _exerciseLogsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutSessionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programSessionId => $composableBuilder(
    column: $table.programSessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionRpe => $composableBuilder(
    column: $table.sessionRpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> exerciseLogsTableRefs(
    Expression<bool> Function($$ExerciseLogsTableTableFilterComposer f) f,
  ) {
    final $$ExerciseLogsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseLogsTable,
      getReferencedColumn: (t) => t.workoutSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableTableFilterComposer(
            $db: $db,
            $table: $db.exerciseLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programSessionId => $composableBuilder(
    column: $table.programSessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionRpe => $composableBuilder(
    column: $table.sessionRpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutSessionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTableTable> {
  $$WorkoutSessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get programSessionId => $composableBuilder(
    column: $table.programSessionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sessionRpe => $composableBuilder(
    column: $table.sessionRpe,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> exerciseLogsTableRefs<T extends Object>(
    Expression<T> Function($$ExerciseLogsTableTableAnnotationComposer a) f,
  ) {
    final $$ExerciseLogsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseLogsTable,
          getReferencedColumn: (t) => t.workoutSessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseLogsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseLogsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutSessionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTableTable,
          WorkoutSessionModel,
          $$WorkoutSessionsTableTableFilterComposer,
          $$WorkoutSessionsTableTableOrderingComposer,
          $$WorkoutSessionsTableTableAnnotationComposer,
          $$WorkoutSessionsTableTableCreateCompanionBuilder,
          $$WorkoutSessionsTableTableUpdateCompanionBuilder,
          (WorkoutSessionModel, $$WorkoutSessionsTableTableReferences),
          WorkoutSessionModel,
          PrefetchHooks Function({bool exerciseLogsTableRefs})
        > {
  $$WorkoutSessionsTableTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> programSessionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<double> totalVolumeKg = const Value.absent(),
                Value<int?> sessionRpe = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsTableCompanion(
                id: id,
                programSessionId: programSessionId,
                name: name,
                startedAt: startedAt,
                finishedAt: finishedAt,
                durationSeconds: durationSeconds,
                totalVolumeKg: totalVolumeKg,
                sessionRpe: sessionRpe,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> programSessionId = const Value.absent(),
                required String name,
                required DateTime startedAt,
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<double> totalVolumeKg = const Value.absent(),
                Value<int?> sessionRpe = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsTableCompanion.insert(
                id: id,
                programSessionId: programSessionId,
                name: name,
                startedAt: startedAt,
                finishedAt: finishedAt,
                durationSeconds: durationSeconds,
                totalVolumeKg: totalVolumeKg,
                sessionRpe: sessionRpe,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutSessionsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({exerciseLogsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (exerciseLogsTableRefs) db.exerciseLogsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (exerciseLogsTableRefs)
                    await $_getPrefetchedData<
                      WorkoutSessionModel,
                      $WorkoutSessionsTableTable,
                      ExerciseLogModel
                    >(
                      currentTable: table,
                      referencedTable: $$WorkoutSessionsTableTableReferences
                          ._exerciseLogsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkoutSessionsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).exerciseLogsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.workoutSessionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutSessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTableTable,
      WorkoutSessionModel,
      $$WorkoutSessionsTableTableFilterComposer,
      $$WorkoutSessionsTableTableOrderingComposer,
      $$WorkoutSessionsTableTableAnnotationComposer,
      $$WorkoutSessionsTableTableCreateCompanionBuilder,
      $$WorkoutSessionsTableTableUpdateCompanionBuilder,
      (WorkoutSessionModel, $$WorkoutSessionsTableTableReferences),
      WorkoutSessionModel,
      PrefetchHooks Function({bool exerciseLogsTableRefs})
    >;
typedef $$ExerciseLogsTableTableCreateCompanionBuilder =
    ExerciseLogsTableCompanion Function({
      required String id,
      required String workoutSessionId,
      required String exerciseId,
      required String exerciseName,
      required int orderInSession,
      Value<int> rowid,
    });
typedef $$ExerciseLogsTableTableUpdateCompanionBuilder =
    ExerciseLogsTableCompanion Function({
      Value<String> id,
      Value<String> workoutSessionId,
      Value<String> exerciseId,
      Value<String> exerciseName,
      Value<int> orderInSession,
      Value<int> rowid,
    });

final class $$ExerciseLogsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExerciseLogsTableTable,
          ExerciseLogModel
        > {
  $$ExerciseLogsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkoutSessionsTableTable _workoutSessionIdTable(_$AppDatabase db) =>
      db.workoutSessionsTable.createAlias(
        'exercise_logs_table__workout_session_id__workout_sessions_table__id',
      );

  $$WorkoutSessionsTableTableProcessedTableManager get workoutSessionId {
    final $_column = $_itemColumn<String>('workout_session_id')!;

    final manager = $$WorkoutSessionsTableTableTableManager(
      $_db,
      $_db.workoutSessionsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutSessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SetLogsTableTable, List<SetLogModel>>
  _setLogsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.setLogsTable,
    aliasName: 'exercise_logs_table__id__set_logs_table__exercise_log_id',
  );

  $$SetLogsTableTableProcessedTableManager get setLogsTableRefs {
    final manager = $$SetLogsTableTableTableManager(
      $_db,
      $_db.setLogsTable,
    ).filter((f) => f.exerciseLogId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_setLogsTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExerciseLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTableTable> {
  $$ExerciseLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderInSession => $composableBuilder(
    column: $table.orderInSession,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutSessionsTableTableFilterComposer get workoutSessionId {
    final $$WorkoutSessionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutSessionId,
      referencedTable: $db.workoutSessionsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> setLogsTableRefs(
    Expression<bool> Function($$SetLogsTableTableFilterComposer f) f,
  ) {
    final $$SetLogsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogsTable,
      getReferencedColumn: (t) => t.exerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableTableFilterComposer(
            $db: $db,
            $table: $db.setLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTableTable> {
  $$ExerciseLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderInSession => $composableBuilder(
    column: $table.orderInSession,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutSessionsTableTableOrderingComposer get workoutSessionId {
    final $$WorkoutSessionsTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.workoutSessionId,
          referencedTable: $db.workoutSessionsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutSessionsTableTableOrderingComposer(
                $db: $db,
                $table: $db.workoutSessionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ExerciseLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseLogsTableTable> {
  $$ExerciseLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderInSession => $composableBuilder(
    column: $table.orderInSession,
    builder: (column) => column,
  );

  $$WorkoutSessionsTableTableAnnotationComposer get workoutSessionId {
    final $$WorkoutSessionsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.workoutSessionId,
          referencedTable: $db.workoutSessionsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WorkoutSessionsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.workoutSessionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> setLogsTableRefs<T extends Object>(
    Expression<T> Function($$SetLogsTableTableAnnotationComposer a) f,
  ) {
    final $$SetLogsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogsTable,
      getReferencedColumn: (t) => t.exerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExerciseLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseLogsTableTable,
          ExerciseLogModel,
          $$ExerciseLogsTableTableFilterComposer,
          $$ExerciseLogsTableTableOrderingComposer,
          $$ExerciseLogsTableTableAnnotationComposer,
          $$ExerciseLogsTableTableCreateCompanionBuilder,
          $$ExerciseLogsTableTableUpdateCompanionBuilder,
          (ExerciseLogModel, $$ExerciseLogsTableTableReferences),
          ExerciseLogModel,
          PrefetchHooks Function({bool workoutSessionId, bool setLogsTableRefs})
        > {
  $$ExerciseLogsTableTableTableManager(
    _$AppDatabase db,
    $ExerciseLogsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseLogsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workoutSessionId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<String> exerciseName = const Value.absent(),
                Value<int> orderInSession = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseLogsTableCompanion(
                id: id,
                workoutSessionId: workoutSessionId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                orderInSession: orderInSession,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String workoutSessionId,
                required String exerciseId,
                required String exerciseName,
                required int orderInSession,
                Value<int> rowid = const Value.absent(),
              }) => ExerciseLogsTableCompanion.insert(
                id: id,
                workoutSessionId: workoutSessionId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                orderInSession: orderInSession,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseLogsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workoutSessionId = false, setLogsTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (setLogsTableRefs) db.setLogsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workoutSessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutSessionId,
                                    referencedTable:
                                        $$ExerciseLogsTableTableReferences
                                            ._workoutSessionIdTable(db),
                                    referencedColumn:
                                        $$ExerciseLogsTableTableReferences
                                            ._workoutSessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (setLogsTableRefs)
                        await $_getPrefetchedData<
                          ExerciseLogModel,
                          $ExerciseLogsTableTable,
                          SetLogModel
                        >(
                          currentTable: table,
                          referencedTable: $$ExerciseLogsTableTableReferences
                              ._setLogsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExerciseLogsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).setLogsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExerciseLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseLogsTableTable,
      ExerciseLogModel,
      $$ExerciseLogsTableTableFilterComposer,
      $$ExerciseLogsTableTableOrderingComposer,
      $$ExerciseLogsTableTableAnnotationComposer,
      $$ExerciseLogsTableTableCreateCompanionBuilder,
      $$ExerciseLogsTableTableUpdateCompanionBuilder,
      (ExerciseLogModel, $$ExerciseLogsTableTableReferences),
      ExerciseLogModel,
      PrefetchHooks Function({bool workoutSessionId, bool setLogsTableRefs})
    >;
typedef $$SetLogsTableTableCreateCompanionBuilder =
    SetLogsTableCompanion Function({
      required String id,
      required String exerciseLogId,
      required int setNumber,
      required SetType type,
      required double weightKg,
      required int reps,
      Value<int?> rir,
      Value<int?> partialReps,
      Value<bool?> isLeft,
      Value<bool?> isRight,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $$SetLogsTableTableUpdateCompanionBuilder =
    SetLogsTableCompanion Function({
      Value<String> id,
      Value<String> exerciseLogId,
      Value<int> setNumber,
      Value<SetType> type,
      Value<double> weightKg,
      Value<int> reps,
      Value<int?> rir,
      Value<int?> partialReps,
      Value<bool?> isLeft,
      Value<bool?> isRight,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

final class $$SetLogsTableTableReferences
    extends BaseReferences<_$AppDatabase, $SetLogsTableTable, SetLogModel> {
  $$SetLogsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExerciseLogsTableTable _exerciseLogIdTable(_$AppDatabase db) => db
      .exerciseLogsTable
      .createAlias('set_logs_table__exercise_log_id__exercise_logs_table__id');

  $$ExerciseLogsTableTableProcessedTableManager get exerciseLogId {
    final $_column = $_itemColumn<String>('exercise_log_id')!;

    final manager = $$ExerciseLogsTableTableTableManager(
      $_db,
      $_db.exerciseLogsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SetLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SetLogsTableTable> {
  $$SetLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SetType, SetType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rir => $composableBuilder(
    column: $table.rir,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get partialReps => $composableBuilder(
    column: $table.partialReps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLeft => $composableBuilder(
    column: $table.isLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRight => $composableBuilder(
    column: $table.isRight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ExerciseLogsTableTableFilterComposer get exerciseLogId {
    final $$ExerciseLogsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseLogId,
      referencedTable: $db.exerciseLogsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableTableFilterComposer(
            $db: $db,
            $table: $db.exerciseLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SetLogsTableTable> {
  $$SetLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rir => $composableBuilder(
    column: $table.rir,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get partialReps => $composableBuilder(
    column: $table.partialReps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLeft => $composableBuilder(
    column: $table.isLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRight => $composableBuilder(
    column: $table.isRight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ExerciseLogsTableTableOrderingComposer get exerciseLogId {
    final $$ExerciseLogsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseLogId,
      referencedTable: $db.exerciseLogsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseLogsTableTableOrderingComposer(
            $db: $db,
            $table: $db.exerciseLogsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetLogsTableTable> {
  $$SetLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SetType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<int> get rir =>
      $composableBuilder(column: $table.rir, builder: (column) => column);

  GeneratedColumn<int> get partialReps => $composableBuilder(
    column: $table.partialReps,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLeft =>
      $composableBuilder(column: $table.isLeft, builder: (column) => column);

  GeneratedColumn<bool> get isRight =>
      $composableBuilder(column: $table.isRight, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  $$ExerciseLogsTableTableAnnotationComposer get exerciseLogId {
    final $$ExerciseLogsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.exerciseLogId,
          referencedTable: $db.exerciseLogsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseLogsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseLogsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetLogsTableTable,
          SetLogModel,
          $$SetLogsTableTableFilterComposer,
          $$SetLogsTableTableOrderingComposer,
          $$SetLogsTableTableAnnotationComposer,
          $$SetLogsTableTableCreateCompanionBuilder,
          $$SetLogsTableTableUpdateCompanionBuilder,
          (SetLogModel, $$SetLogsTableTableReferences),
          SetLogModel,
          PrefetchHooks Function({bool exerciseLogId})
        > {
  $$SetLogsTableTableTableManager(_$AppDatabase db, $SetLogsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetLogsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> exerciseLogId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<SetType> type = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<int?> rir = const Value.absent(),
                Value<int?> partialReps = const Value.absent(),
                Value<bool?> isLeft = const Value.absent(),
                Value<bool?> isRight = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogsTableCompanion(
                id: id,
                exerciseLogId: exerciseLogId,
                setNumber: setNumber,
                type: type,
                weightKg: weightKg,
                reps: reps,
                rir: rir,
                partialReps: partialReps,
                isLeft: isLeft,
                isRight: isRight,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String exerciseLogId,
                required int setNumber,
                required SetType type,
                required double weightKg,
                required int reps,
                Value<int?> rir = const Value.absent(),
                Value<int?> partialReps = const Value.absent(),
                Value<bool?> isLeft = const Value.absent(),
                Value<bool?> isRight = const Value.absent(),
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => SetLogsTableCompanion.insert(
                id: id,
                exerciseLogId: exerciseLogId,
                setNumber: setNumber,
                type: type,
                weightKg: weightKg,
                reps: reps,
                rir: rir,
                partialReps: partialReps,
                isLeft: isLeft,
                isRight: isRight,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetLogsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({exerciseLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (exerciseLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.exerciseLogId,
                                referencedTable: $$SetLogsTableTableReferences
                                    ._exerciseLogIdTable(db),
                                referencedColumn: $$SetLogsTableTableReferences
                                    ._exerciseLogIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SetLogsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetLogsTableTable,
      SetLogModel,
      $$SetLogsTableTableFilterComposer,
      $$SetLogsTableTableOrderingComposer,
      $$SetLogsTableTableAnnotationComposer,
      $$SetLogsTableTableCreateCompanionBuilder,
      $$SetLogsTableTableUpdateCompanionBuilder,
      (SetLogModel, $$SetLogsTableTableReferences),
      SetLogModel,
      PrefetchHooks Function({bool exerciseLogId})
    >;
typedef $$ProgramsTableTableCreateCompanionBuilder =
    ProgramsTableCompanion Function({
      required String id,
      required String name,
      Value<String?> author,
      required int totalWeeks,
      required bool isCustom,
      required bool isImported,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ProgramsTableTableUpdateCompanionBuilder =
    ProgramsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> author,
      Value<int> totalWeeks,
      Value<bool> isCustom,
      Value<bool> isImported,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ProgramsTableTableReferences
    extends BaseReferences<_$AppDatabase, $ProgramsTableTable, ProgramModel> {
  $$ProgramsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProgramBlocksTableTable, List<ProgramBlockModel>>
  _programBlocksTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.programBlocksTable,
        aliasName: 'programs_table__id__program_blocks_table__program_id',
      );

  $$ProgramBlocksTableTableProcessedTableManager get programBlocksTableRefs {
    final manager = $$ProgramBlocksTableTableTableManager(
      $_db,
      $_db.programBlocksTable,
    ).filter((f) => f.programId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _programBlocksTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProgramsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramsTableTable> {
  $$ProgramsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalWeeks => $composableBuilder(
    column: $table.totalWeeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isImported => $composableBuilder(
    column: $table.isImported,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> programBlocksTableRefs(
    Expression<bool> Function($$ProgramBlocksTableTableFilterComposer f) f,
  ) {
    final $$ProgramBlocksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.programBlocksTable,
      getReferencedColumn: (t) => t.programId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramBlocksTableTableFilterComposer(
            $db: $db,
            $table: $db.programBlocksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProgramsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramsTableTable> {
  $$ProgramsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalWeeks => $composableBuilder(
    column: $table.totalWeeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isImported => $composableBuilder(
    column: $table.isImported,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgramsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramsTableTable> {
  $$ProgramsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<int> get totalWeeks => $composableBuilder(
    column: $table.totalWeeks,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<bool> get isImported => $composableBuilder(
    column: $table.isImported,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> programBlocksTableRefs<T extends Object>(
    Expression<T> Function($$ProgramBlocksTableTableAnnotationComposer a) f,
  ) {
    final $$ProgramBlocksTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.programBlocksTable,
          getReferencedColumn: (t) => t.programId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramBlocksTableTableAnnotationComposer(
                $db: $db,
                $table: $db.programBlocksTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProgramsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramsTableTable,
          ProgramModel,
          $$ProgramsTableTableFilterComposer,
          $$ProgramsTableTableOrderingComposer,
          $$ProgramsTableTableAnnotationComposer,
          $$ProgramsTableTableCreateCompanionBuilder,
          $$ProgramsTableTableUpdateCompanionBuilder,
          (ProgramModel, $$ProgramsTableTableReferences),
          ProgramModel,
          PrefetchHooks Function({bool programBlocksTableRefs})
        > {
  $$ProgramsTableTableTableManager(_$AppDatabase db, $ProgramsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<int> totalWeeks = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isImported = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramsTableCompanion(
                id: id,
                name: name,
                author: author,
                totalWeeks: totalWeeks,
                isCustom: isCustom,
                isImported: isImported,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> author = const Value.absent(),
                required int totalWeeks,
                required bool isCustom,
                required bool isImported,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProgramsTableCompanion.insert(
                id: id,
                name: name,
                author: author,
                totalWeeks: totalWeeks,
                isCustom: isCustom,
                isImported: isImported,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgramsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({programBlocksTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (programBlocksTableRefs) db.programBlocksTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (programBlocksTableRefs)
                    await $_getPrefetchedData<
                      ProgramModel,
                      $ProgramsTableTable,
                      ProgramBlockModel
                    >(
                      currentTable: table,
                      referencedTable: $$ProgramsTableTableReferences
                          ._programBlocksTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProgramsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).programBlocksTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.programId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProgramsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramsTableTable,
      ProgramModel,
      $$ProgramsTableTableFilterComposer,
      $$ProgramsTableTableOrderingComposer,
      $$ProgramsTableTableAnnotationComposer,
      $$ProgramsTableTableCreateCompanionBuilder,
      $$ProgramsTableTableUpdateCompanionBuilder,
      (ProgramModel, $$ProgramsTableTableReferences),
      ProgramModel,
      PrefetchHooks Function({bool programBlocksTableRefs})
    >;
typedef $$ProgramBlocksTableTableCreateCompanionBuilder =
    ProgramBlocksTableCompanion Function({
      required String id,
      required String programId,
      required String name,
      required int weeks,
      required BlockType type,
      Value<int> rowid,
    });
typedef $$ProgramBlocksTableTableUpdateCompanionBuilder =
    ProgramBlocksTableCompanion Function({
      Value<String> id,
      Value<String> programId,
      Value<String> name,
      Value<int> weeks,
      Value<BlockType> type,
      Value<int> rowid,
    });

final class $$ProgramBlocksTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProgramBlocksTableTable,
          ProgramBlockModel
        > {
  $$ProgramBlocksTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProgramsTableTable _programIdTable(_$AppDatabase db) => db
      .programsTable
      .createAlias('program_blocks_table__program_id__programs_table__id');

  $$ProgramsTableTableProcessedTableManager get programId {
    final $_column = $_itemColumn<String>('program_id')!;

    final manager = $$ProgramsTableTableTableManager(
      $_db,
      $_db.programsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_programIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ProgramSessionsTableTable,
    List<ProgramSessionModel>
  >
  _programSessionsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.programSessionsTable,
        aliasName: 'program_blocks_table__id__program_sessions_table__block_id',
      );

  $$ProgramSessionsTableTableProcessedTableManager
  get programSessionsTableRefs {
    final manager = $$ProgramSessionsTableTableTableManager(
      $_db,
      $_db.programSessionsTable,
    ).filter((f) => f.blockId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _programSessionsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProgramBlocksTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramBlocksTableTable> {
  $$ProgramBlocksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeks => $composableBuilder(
    column: $table.weeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<BlockType, BlockType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$ProgramsTableTableFilterComposer get programId {
    final $$ProgramsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programId,
      referencedTable: $db.programsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramsTableTableFilterComposer(
            $db: $db,
            $table: $db.programsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> programSessionsTableRefs(
    Expression<bool> Function($$ProgramSessionsTableTableFilterComposer f) f,
  ) {
    final $$ProgramSessionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.programSessionsTable,
      getReferencedColumn: (t) => t.blockId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramSessionsTableTableFilterComposer(
            $db: $db,
            $table: $db.programSessionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProgramBlocksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramBlocksTableTable> {
  $$ProgramBlocksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeks => $composableBuilder(
    column: $table.weeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProgramsTableTableOrderingComposer get programId {
    final $$ProgramsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programId,
      referencedTable: $db.programsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramsTableTableOrderingComposer(
            $db: $db,
            $table: $db.programsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgramBlocksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramBlocksTableTable> {
  $$ProgramBlocksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get weeks =>
      $composableBuilder(column: $table.weeks, builder: (column) => column);

  GeneratedColumnWithTypeConverter<BlockType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$ProgramsTableTableAnnotationComposer get programId {
    final $$ProgramsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.programId,
      referencedTable: $db.programsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.programsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> programSessionsTableRefs<T extends Object>(
    Expression<T> Function($$ProgramSessionsTableTableAnnotationComposer a) f,
  ) {
    final $$ProgramSessionsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.programSessionsTable,
          getReferencedColumn: (t) => t.blockId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramSessionsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.programSessionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProgramBlocksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramBlocksTableTable,
          ProgramBlockModel,
          $$ProgramBlocksTableTableFilterComposer,
          $$ProgramBlocksTableTableOrderingComposer,
          $$ProgramBlocksTableTableAnnotationComposer,
          $$ProgramBlocksTableTableCreateCompanionBuilder,
          $$ProgramBlocksTableTableUpdateCompanionBuilder,
          (ProgramBlockModel, $$ProgramBlocksTableTableReferences),
          ProgramBlockModel,
          PrefetchHooks Function({
            bool programId,
            bool programSessionsTableRefs,
          })
        > {
  $$ProgramBlocksTableTableTableManager(
    _$AppDatabase db,
    $ProgramBlocksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramBlocksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramBlocksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramBlocksTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> programId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> weeks = const Value.absent(),
                Value<BlockType> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramBlocksTableCompanion(
                id: id,
                programId: programId,
                name: name,
                weeks: weeks,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String programId,
                required String name,
                required int weeks,
                required BlockType type,
                Value<int> rowid = const Value.absent(),
              }) => ProgramBlocksTableCompanion.insert(
                id: id,
                programId: programId,
                name: name,
                weeks: weeks,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgramBlocksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({programId = false, programSessionsTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (programSessionsTableRefs) db.programSessionsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (programId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.programId,
                                    referencedTable:
                                        $$ProgramBlocksTableTableReferences
                                            ._programIdTable(db),
                                    referencedColumn:
                                        $$ProgramBlocksTableTableReferences
                                            ._programIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (programSessionsTableRefs)
                        await $_getPrefetchedData<
                          ProgramBlockModel,
                          $ProgramBlocksTableTable,
                          ProgramSessionModel
                        >(
                          currentTable: table,
                          referencedTable: $$ProgramBlocksTableTableReferences
                              ._programSessionsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProgramBlocksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).programSessionsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.blockId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProgramBlocksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramBlocksTableTable,
      ProgramBlockModel,
      $$ProgramBlocksTableTableFilterComposer,
      $$ProgramBlocksTableTableOrderingComposer,
      $$ProgramBlocksTableTableAnnotationComposer,
      $$ProgramBlocksTableTableCreateCompanionBuilder,
      $$ProgramBlocksTableTableUpdateCompanionBuilder,
      (ProgramBlockModel, $$ProgramBlocksTableTableReferences),
      ProgramBlockModel,
      PrefetchHooks Function({bool programId, bool programSessionsTableRefs})
    >;
typedef $$ProgramSessionsTableTableCreateCompanionBuilder =
    ProgramSessionsTableCompanion Function({
      required String id,
      required String blockId,
      required int dayOfWeek,
      required String name,
      required int estimatedDurationMinutes,
      Value<int> rowid,
    });
typedef $$ProgramSessionsTableTableUpdateCompanionBuilder =
    ProgramSessionsTableCompanion Function({
      Value<String> id,
      Value<String> blockId,
      Value<int> dayOfWeek,
      Value<String> name,
      Value<int> estimatedDurationMinutes,
      Value<int> rowid,
    });

final class $$ProgramSessionsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProgramSessionsTableTable,
          ProgramSessionModel
        > {
  $$ProgramSessionsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProgramBlocksTableTable _blockIdTable(_$AppDatabase db) =>
      db.programBlocksTable.createAlias(
        'program_sessions_table__block_id__program_blocks_table__id',
      );

  $$ProgramBlocksTableTableProcessedTableManager get blockId {
    final $_column = $_itemColumn<String>('block_id')!;

    final manager = $$ProgramBlocksTableTableTableManager(
      $_db,
      $_db.programBlocksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_blockIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ProgramExercisesTableTable,
    List<ProgramExerciseModel>
  >
  _programExercisesTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.programExercisesTable,
        aliasName:
            'program_sessions_table__id__program_exercises_table__session_id',
      );

  $$ProgramExercisesTableTableProcessedTableManager
  get programExercisesTableRefs {
    final manager = $$ProgramExercisesTableTableTableManager(
      $_db,
      $_db.programExercisesTable,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _programExercisesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProgramSessionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramSessionsTableTable> {
  $$ProgramSessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$ProgramBlocksTableTableFilterComposer get blockId {
    final $$ProgramBlocksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.blockId,
      referencedTable: $db.programBlocksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramBlocksTableTableFilterComposer(
            $db: $db,
            $table: $db.programBlocksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> programExercisesTableRefs(
    Expression<bool> Function($$ProgramExercisesTableTableFilterComposer f) f,
  ) {
    final $$ProgramExercisesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.programExercisesTable,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramExercisesTableTableFilterComposer(
                $db: $db,
                $table: $db.programExercisesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProgramSessionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramSessionsTableTable> {
  $$ProgramSessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProgramBlocksTableTableOrderingComposer get blockId {
    final $$ProgramBlocksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.blockId,
      referencedTable: $db.programBlocksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramBlocksTableTableOrderingComposer(
            $db: $db,
            $table: $db.programBlocksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgramSessionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramSessionsTableTable> {
  $$ProgramSessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get estimatedDurationMinutes => $composableBuilder(
    column: $table.estimatedDurationMinutes,
    builder: (column) => column,
  );

  $$ProgramBlocksTableTableAnnotationComposer get blockId {
    final $$ProgramBlocksTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.blockId,
          referencedTable: $db.programBlocksTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramBlocksTableTableAnnotationComposer(
                $db: $db,
                $table: $db.programBlocksTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> programExercisesTableRefs<T extends Object>(
    Expression<T> Function($$ProgramExercisesTableTableAnnotationComposer a) f,
  ) {
    final $$ProgramExercisesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.programExercisesTable,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramExercisesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.programExercisesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProgramSessionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramSessionsTableTable,
          ProgramSessionModel,
          $$ProgramSessionsTableTableFilterComposer,
          $$ProgramSessionsTableTableOrderingComposer,
          $$ProgramSessionsTableTableAnnotationComposer,
          $$ProgramSessionsTableTableCreateCompanionBuilder,
          $$ProgramSessionsTableTableUpdateCompanionBuilder,
          (ProgramSessionModel, $$ProgramSessionsTableTableReferences),
          ProgramSessionModel,
          PrefetchHooks Function({bool blockId, bool programExercisesTableRefs})
        > {
  $$ProgramSessionsTableTableTableManager(
    _$AppDatabase db,
    $ProgramSessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramSessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramSessionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProgramSessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> blockId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> estimatedDurationMinutes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramSessionsTableCompanion(
                id: id,
                blockId: blockId,
                dayOfWeek: dayOfWeek,
                name: name,
                estimatedDurationMinutes: estimatedDurationMinutes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String blockId,
                required int dayOfWeek,
                required String name,
                required int estimatedDurationMinutes,
                Value<int> rowid = const Value.absent(),
              }) => ProgramSessionsTableCompanion.insert(
                id: id,
                blockId: blockId,
                dayOfWeek: dayOfWeek,
                name: name,
                estimatedDurationMinutes: estimatedDurationMinutes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgramSessionsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({blockId = false, programExercisesTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (programExercisesTableRefs) db.programExercisesTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (blockId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.blockId,
                                    referencedTable:
                                        $$ProgramSessionsTableTableReferences
                                            ._blockIdTable(db),
                                    referencedColumn:
                                        $$ProgramSessionsTableTableReferences
                                            ._blockIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (programExercisesTableRefs)
                        await $_getPrefetchedData<
                          ProgramSessionModel,
                          $ProgramSessionsTableTable,
                          ProgramExerciseModel
                        >(
                          currentTable: table,
                          referencedTable: $$ProgramSessionsTableTableReferences
                              ._programExercisesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProgramSessionsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).programExercisesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProgramSessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramSessionsTableTable,
      ProgramSessionModel,
      $$ProgramSessionsTableTableFilterComposer,
      $$ProgramSessionsTableTableOrderingComposer,
      $$ProgramSessionsTableTableAnnotationComposer,
      $$ProgramSessionsTableTableCreateCompanionBuilder,
      $$ProgramSessionsTableTableUpdateCompanionBuilder,
      (ProgramSessionModel, $$ProgramSessionsTableTableReferences),
      ProgramSessionModel,
      PrefetchHooks Function({bool blockId, bool programExercisesTableRefs})
    >;
typedef $$ProgramExercisesTableTableCreateCompanionBuilder =
    ProgramExercisesTableCompanion Function({
      required String id,
      required String sessionId,
      required String exerciseId,
      required String exerciseName,
      required int sets,
      required int repMin,
      required int repMax,
      Value<int?> rirTarget,
      required int restSeconds,
      Value<String> allowedSetTypesStr,
      Value<int> rowid,
    });
typedef $$ProgramExercisesTableTableUpdateCompanionBuilder =
    ProgramExercisesTableCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String> exerciseId,
      Value<String> exerciseName,
      Value<int> sets,
      Value<int> repMin,
      Value<int> repMax,
      Value<int?> rirTarget,
      Value<int> restSeconds,
      Value<String> allowedSetTypesStr,
      Value<int> rowid,
    });

final class $$ProgramExercisesTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProgramExercisesTableTable,
          ProgramExerciseModel
        > {
  $$ProgramExercisesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProgramSessionsTableTable _sessionIdTable(_$AppDatabase db) =>
      db.programSessionsTable.createAlias(
        'program_exercises_table__session_id__program_sessions_table__id',
      );

  $$ProgramSessionsTableTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$ProgramSessionsTableTableTableManager(
      $_db,
      $_db.programSessionsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProgramExercisesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramExercisesTableTable> {
  $$ProgramExercisesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repMin => $composableBuilder(
    column: $table.repMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repMax => $composableBuilder(
    column: $table.repMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rirTarget => $composableBuilder(
    column: $table.rirTarget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allowedSetTypesStr => $composableBuilder(
    column: $table.allowedSetTypesStr,
    builder: (column) => ColumnFilters(column),
  );

  $$ProgramSessionsTableTableFilterComposer get sessionId {
    final $$ProgramSessionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.programSessionsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgramSessionsTableTableFilterComposer(
            $db: $db,
            $table: $db.programSessionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgramExercisesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramExercisesTableTable> {
  $$ProgramExercisesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repMin => $composableBuilder(
    column: $table.repMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repMax => $composableBuilder(
    column: $table.repMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rirTarget => $composableBuilder(
    column: $table.rirTarget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allowedSetTypesStr => $composableBuilder(
    column: $table.allowedSetTypesStr,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProgramSessionsTableTableOrderingComposer get sessionId {
    final $$ProgramSessionsTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.sessionId,
          referencedTable: $db.programSessionsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramSessionsTableTableOrderingComposer(
                $db: $db,
                $table: $db.programSessionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ProgramExercisesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramExercisesTableTable> {
  $$ProgramExercisesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseName => $composableBuilder(
    column: $table.exerciseName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<int> get repMin =>
      $composableBuilder(column: $table.repMin, builder: (column) => column);

  GeneratedColumn<int> get repMax =>
      $composableBuilder(column: $table.repMax, builder: (column) => column);

  GeneratedColumn<int> get rirTarget =>
      $composableBuilder(column: $table.rirTarget, builder: (column) => column);

  GeneratedColumn<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allowedSetTypesStr => $composableBuilder(
    column: $table.allowedSetTypesStr,
    builder: (column) => column,
  );

  $$ProgramSessionsTableTableAnnotationComposer get sessionId {
    final $$ProgramSessionsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.sessionId,
          referencedTable: $db.programSessionsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProgramSessionsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.programSessionsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ProgramExercisesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramExercisesTableTable,
          ProgramExerciseModel,
          $$ProgramExercisesTableTableFilterComposer,
          $$ProgramExercisesTableTableOrderingComposer,
          $$ProgramExercisesTableTableAnnotationComposer,
          $$ProgramExercisesTableTableCreateCompanionBuilder,
          $$ProgramExercisesTableTableUpdateCompanionBuilder,
          (ProgramExerciseModel, $$ProgramExercisesTableTableReferences),
          ProgramExerciseModel,
          PrefetchHooks Function({bool sessionId})
        > {
  $$ProgramExercisesTableTableTableManager(
    _$AppDatabase db,
    $ProgramExercisesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramExercisesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ProgramExercisesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProgramExercisesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<String> exerciseName = const Value.absent(),
                Value<int> sets = const Value.absent(),
                Value<int> repMin = const Value.absent(),
                Value<int> repMax = const Value.absent(),
                Value<int?> rirTarget = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String> allowedSetTypesStr = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramExercisesTableCompanion(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                sets: sets,
                repMin: repMin,
                repMax: repMax,
                rirTarget: rirTarget,
                restSeconds: restSeconds,
                allowedSetTypesStr: allowedSetTypesStr,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String exerciseId,
                required String exerciseName,
                required int sets,
                required int repMin,
                required int repMax,
                Value<int?> rirTarget = const Value.absent(),
                required int restSeconds,
                Value<String> allowedSetTypesStr = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramExercisesTableCompanion.insert(
                id: id,
                sessionId: sessionId,
                exerciseId: exerciseId,
                exerciseName: exerciseName,
                sets: sets,
                repMin: repMin,
                repMax: repMax,
                rirTarget: rirTarget,
                restSeconds: restSeconds,
                allowedSetTypesStr: allowedSetTypesStr,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgramExercisesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable:
                                    $$ProgramExercisesTableTableReferences
                                        ._sessionIdTable(db),
                                referencedColumn:
                                    $$ProgramExercisesTableTableReferences
                                        ._sessionIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProgramExercisesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramExercisesTableTable,
      ProgramExerciseModel,
      $$ProgramExercisesTableTableFilterComposer,
      $$ProgramExercisesTableTableOrderingComposer,
      $$ProgramExercisesTableTableAnnotationComposer,
      $$ProgramExercisesTableTableCreateCompanionBuilder,
      $$ProgramExercisesTableTableUpdateCompanionBuilder,
      (ProgramExerciseModel, $$ProgramExercisesTableTableReferences),
      ProgramExerciseModel,
      PrefetchHooks Function({bool sessionId})
    >;
typedef $$BodyWeightEntriesTableTableCreateCompanionBuilder =
    BodyWeightEntriesTableCompanion Function({
      required String id,
      required double weightKg,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$BodyWeightEntriesTableTableUpdateCompanionBuilder =
    BodyWeightEntriesTableCompanion Function({
      Value<String> id,
      Value<double> weightKg,
      Value<DateTime> date,
      Value<int> rowid,
    });

class $$BodyWeightEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $BodyWeightEntriesTableTable> {
  $$BodyWeightEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BodyWeightEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyWeightEntriesTableTable> {
  $$BodyWeightEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BodyWeightEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyWeightEntriesTableTable> {
  $$BodyWeightEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$BodyWeightEntriesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyWeightEntriesTableTable,
          BodyWeightEntryModel,
          $$BodyWeightEntriesTableTableFilterComposer,
          $$BodyWeightEntriesTableTableOrderingComposer,
          $$BodyWeightEntriesTableTableAnnotationComposer,
          $$BodyWeightEntriesTableTableCreateCompanionBuilder,
          $$BodyWeightEntriesTableTableUpdateCompanionBuilder,
          (
            BodyWeightEntryModel,
            BaseReferences<
              _$AppDatabase,
              $BodyWeightEntriesTableTable,
              BodyWeightEntryModel
            >,
          ),
          BodyWeightEntryModel,
          PrefetchHooks Function()
        > {
  $$BodyWeightEntriesTableTableTableManager(
    _$AppDatabase db,
    $BodyWeightEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyWeightEntriesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BodyWeightEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BodyWeightEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyWeightEntriesTableCompanion(
                id: id,
                weightKg: weightKg,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double weightKg,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => BodyWeightEntriesTableCompanion.insert(
                id: id,
                weightKg: weightKg,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BodyWeightEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyWeightEntriesTableTable,
      BodyWeightEntryModel,
      $$BodyWeightEntriesTableTableFilterComposer,
      $$BodyWeightEntriesTableTableOrderingComposer,
      $$BodyWeightEntriesTableTableAnnotationComposer,
      $$BodyWeightEntriesTableTableCreateCompanionBuilder,
      $$BodyWeightEntriesTableTableUpdateCompanionBuilder,
      (
        BodyWeightEntryModel,
        BaseReferences<
          _$AppDatabase,
          $BodyWeightEntriesTableTable,
          BodyWeightEntryModel
        >,
      ),
      BodyWeightEntryModel,
      PrefetchHooks Function()
    >;
typedef $$BodyMeasurementsTableTableCreateCompanionBuilder =
    BodyMeasurementsTableCompanion Function({
      required String id,
      required MeasurementType type,
      required double valueCm,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$BodyMeasurementsTableTableUpdateCompanionBuilder =
    BodyMeasurementsTableCompanion Function({
      Value<String> id,
      Value<MeasurementType> type,
      Value<double> valueCm,
      Value<DateTime> date,
      Value<int> rowid,
    });

class $$BodyMeasurementsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTableTable> {
  $$BodyMeasurementsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MeasurementType, MeasurementType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get valueCm => $composableBuilder(
    column: $table.valueCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BodyMeasurementsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTableTable> {
  $$BodyMeasurementsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valueCm => $composableBuilder(
    column: $table.valueCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BodyMeasurementsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTableTable> {
  $$BodyMeasurementsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MeasurementType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get valueCm =>
      $composableBuilder(column: $table.valueCm, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$BodyMeasurementsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyMeasurementsTableTable,
          BodyMeasurementModel,
          $$BodyMeasurementsTableTableFilterComposer,
          $$BodyMeasurementsTableTableOrderingComposer,
          $$BodyMeasurementsTableTableAnnotationComposer,
          $$BodyMeasurementsTableTableCreateCompanionBuilder,
          $$BodyMeasurementsTableTableUpdateCompanionBuilder,
          (
            BodyMeasurementModel,
            BaseReferences<
              _$AppDatabase,
              $BodyMeasurementsTableTable,
              BodyMeasurementModel
            >,
          ),
          BodyMeasurementModel,
          PrefetchHooks Function()
        > {
  $$BodyMeasurementsTableTableTableManager(
    _$AppDatabase db,
    $BodyMeasurementsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<MeasurementType> type = const Value.absent(),
                Value<double> valueCm = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsTableCompanion(
                id: id,
                type: type,
                valueCm: valueCm,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required MeasurementType type,
                required double valueCm,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsTableCompanion.insert(
                id: id,
                type: type,
                valueCm: valueCm,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BodyMeasurementsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyMeasurementsTableTable,
      BodyMeasurementModel,
      $$BodyMeasurementsTableTableFilterComposer,
      $$BodyMeasurementsTableTableOrderingComposer,
      $$BodyMeasurementsTableTableAnnotationComposer,
      $$BodyMeasurementsTableTableCreateCompanionBuilder,
      $$BodyMeasurementsTableTableUpdateCompanionBuilder,
      (
        BodyMeasurementModel,
        BaseReferences<
          _$AppDatabase,
          $BodyMeasurementsTableTable,
          BodyMeasurementModel
        >,
      ),
      BodyMeasurementModel,
      PrefetchHooks Function()
    >;
typedef $$GymProfilesTableTableCreateCompanionBuilder =
    GymProfilesTableCompanion Function({
      required String id,
      required String name,
      required double barWeightKg,
      required String availablePlatesKgStr,
      Value<int> rowid,
    });
typedef $$GymProfilesTableTableUpdateCompanionBuilder =
    GymProfilesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> barWeightKg,
      Value<String> availablePlatesKgStr,
      Value<int> rowid,
    });

class $$GymProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $GymProfilesTableTable> {
  $$GymProfilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get barWeightKg => $composableBuilder(
    column: $table.barWeightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get availablePlatesKgStr => $composableBuilder(
    column: $table.availablePlatesKgStr,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GymProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GymProfilesTableTable> {
  $$GymProfilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get barWeightKg => $composableBuilder(
    column: $table.barWeightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availablePlatesKgStr => $composableBuilder(
    column: $table.availablePlatesKgStr,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GymProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GymProfilesTableTable> {
  $$GymProfilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get barWeightKg => $composableBuilder(
    column: $table.barWeightKg,
    builder: (column) => column,
  );

  GeneratedColumn<String> get availablePlatesKgStr => $composableBuilder(
    column: $table.availablePlatesKgStr,
    builder: (column) => column,
  );
}

class $$GymProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GymProfilesTableTable,
          GymProfileModel,
          $$GymProfilesTableTableFilterComposer,
          $$GymProfilesTableTableOrderingComposer,
          $$GymProfilesTableTableAnnotationComposer,
          $$GymProfilesTableTableCreateCompanionBuilder,
          $$GymProfilesTableTableUpdateCompanionBuilder,
          (
            GymProfileModel,
            BaseReferences<
              _$AppDatabase,
              $GymProfilesTableTable,
              GymProfileModel
            >,
          ),
          GymProfileModel,
          PrefetchHooks Function()
        > {
  $$GymProfilesTableTableTableManager(
    _$AppDatabase db,
    $GymProfilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GymProfilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GymProfilesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GymProfilesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> barWeightKg = const Value.absent(),
                Value<String> availablePlatesKgStr = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GymProfilesTableCompanion(
                id: id,
                name: name,
                barWeightKg: barWeightKg,
                availablePlatesKgStr: availablePlatesKgStr,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double barWeightKg,
                required String availablePlatesKgStr,
                Value<int> rowid = const Value.absent(),
              }) => GymProfilesTableCompanion.insert(
                id: id,
                name: name,
                barWeightKg: barWeightKg,
                availablePlatesKgStr: availablePlatesKgStr,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GymProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GymProfilesTableTable,
      GymProfileModel,
      $$GymProfilesTableTableFilterComposer,
      $$GymProfilesTableTableOrderingComposer,
      $$GymProfilesTableTableAnnotationComposer,
      $$GymProfilesTableTableCreateCompanionBuilder,
      $$GymProfilesTableTableUpdateCompanionBuilder,
      (
        GymProfileModel,
        BaseReferences<_$AppDatabase, $GymProfilesTableTable, GymProfileModel>,
      ),
      GymProfileModel,
      PrefetchHooks Function()
    >;
typedef $$UserProfilesTableTableCreateCompanionBuilder =
    UserProfilesTableCompanion Function({
      required String id,
      required String email,
      required Goal goal,
      required ExperienceLevel experience,
      required int trainingDaysPerWeek,
      required int sessionDurationMinutes,
      required WeightUnit unit,
      required String activeGymProfileId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$UserProfilesTableTableUpdateCompanionBuilder =
    UserProfilesTableCompanion Function({
      Value<String> id,
      Value<String> email,
      Value<Goal> goal,
      Value<ExperienceLevel> experience,
      Value<int> trainingDaysPerWeek,
      Value<int> sessionDurationMinutes,
      Value<WeightUnit> unit,
      Value<String> activeGymProfileId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$UserProfilesTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTableTable> {
  $$UserProfilesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Goal, Goal, int> get goal =>
      $composableBuilder(
        column: $table.goal,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<ExperienceLevel, ExperienceLevel, int>
  get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionDurationMinutes => $composableBuilder(
    column: $table.sessionDurationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WeightUnit, WeightUnit, int> get unit =>
      $composableBuilder(
        column: $table.unit,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get activeGymProfileId => $composableBuilder(
    column: $table.activeGymProfileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTableTable> {
  $$UserProfilesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionDurationMinutes => $composableBuilder(
    column: $table.sessionDurationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activeGymProfileId => $composableBuilder(
    column: $table.activeGymProfileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTableTable> {
  $$UserProfilesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Goal, int> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ExperienceLevel, int> get experience =>
      $composableBuilder(
        column: $table.experience,
        builder: (column) => column,
      );

  GeneratedColumn<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sessionDurationMinutes => $composableBuilder(
    column: $table.sessionDurationMinutes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<WeightUnit, int> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get activeGymProfileId => $composableBuilder(
    column: $table.activeGymProfileId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UserProfilesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTableTable,
          UserProfileModel,
          $$UserProfilesTableTableFilterComposer,
          $$UserProfilesTableTableOrderingComposer,
          $$UserProfilesTableTableAnnotationComposer,
          $$UserProfilesTableTableCreateCompanionBuilder,
          $$UserProfilesTableTableUpdateCompanionBuilder,
          (
            UserProfileModel,
            BaseReferences<
              _$AppDatabase,
              $UserProfilesTableTable,
              UserProfileModel
            >,
          ),
          UserProfileModel,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableTableManager(
    _$AppDatabase db,
    $UserProfilesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<Goal> goal = const Value.absent(),
                Value<ExperienceLevel> experience = const Value.absent(),
                Value<int> trainingDaysPerWeek = const Value.absent(),
                Value<int> sessionDurationMinutes = const Value.absent(),
                Value<WeightUnit> unit = const Value.absent(),
                Value<String> activeGymProfileId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesTableCompanion(
                id: id,
                email: email,
                goal: goal,
                experience: experience,
                trainingDaysPerWeek: trainingDaysPerWeek,
                sessionDurationMinutes: sessionDurationMinutes,
                unit: unit,
                activeGymProfileId: activeGymProfileId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String email,
                required Goal goal,
                required ExperienceLevel experience,
                required int trainingDaysPerWeek,
                required int sessionDurationMinutes,
                required WeightUnit unit,
                required String activeGymProfileId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesTableCompanion.insert(
                id: id,
                email: email,
                goal: goal,
                experience: experience,
                trainingDaysPerWeek: trainingDaysPerWeek,
                sessionDurationMinutes: sessionDurationMinutes,
                unit: unit,
                activeGymProfileId: activeGymProfileId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTableTable,
      UserProfileModel,
      $$UserProfilesTableTableFilterComposer,
      $$UserProfilesTableTableOrderingComposer,
      $$UserProfilesTableTableAnnotationComposer,
      $$UserProfilesTableTableCreateCompanionBuilder,
      $$UserProfilesTableTableUpdateCompanionBuilder,
      (
        UserProfileModel,
        BaseReferences<
          _$AppDatabase,
          $UserProfilesTableTable,
          UserProfileModel
        >,
      ),
      UserProfileModel,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExercisesTableTableTableManager get exercisesTable =>
      $$ExercisesTableTableTableManager(_db, _db.exercisesTable);
  $$WorkoutSessionsTableTableTableManager get workoutSessionsTable =>
      $$WorkoutSessionsTableTableTableManager(_db, _db.workoutSessionsTable);
  $$ExerciseLogsTableTableTableManager get exerciseLogsTable =>
      $$ExerciseLogsTableTableTableManager(_db, _db.exerciseLogsTable);
  $$SetLogsTableTableTableManager get setLogsTable =>
      $$SetLogsTableTableTableManager(_db, _db.setLogsTable);
  $$ProgramsTableTableTableManager get programsTable =>
      $$ProgramsTableTableTableManager(_db, _db.programsTable);
  $$ProgramBlocksTableTableTableManager get programBlocksTable =>
      $$ProgramBlocksTableTableTableManager(_db, _db.programBlocksTable);
  $$ProgramSessionsTableTableTableManager get programSessionsTable =>
      $$ProgramSessionsTableTableTableManager(_db, _db.programSessionsTable);
  $$ProgramExercisesTableTableTableManager get programExercisesTable =>
      $$ProgramExercisesTableTableTableManager(_db, _db.programExercisesTable);
  $$BodyWeightEntriesTableTableTableManager get bodyWeightEntriesTable =>
      $$BodyWeightEntriesTableTableTableManager(
        _db,
        _db.bodyWeightEntriesTable,
      );
  $$BodyMeasurementsTableTableTableManager get bodyMeasurementsTable =>
      $$BodyMeasurementsTableTableTableManager(_db, _db.bodyMeasurementsTable);
  $$GymProfilesTableTableTableManager get gymProfilesTable =>
      $$GymProfilesTableTableTableManager(_db, _db.gymProfilesTable);
  $$UserProfilesTableTableTableManager get userProfilesTable =>
      $$UserProfilesTableTableTableManager(_db, _db.userProfilesTable);
}
