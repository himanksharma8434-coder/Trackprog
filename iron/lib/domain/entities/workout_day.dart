import 'package:equatable/equatable.dart';
import 'exercise.dart';

class WorkoutDay extends Equatable {
  final String id;
  final String name;
  final List<Exercise> exercises;

  const WorkoutDay({
    required this.id,
    required this.name,
    this.exercises = const [],
  });

  WorkoutDay copyWith({
    String? id,
    String? name,
    List<Exercise>? exercises,
  }) {
    return WorkoutDay(
      id: id ?? this.id,
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'exercises': exercises.map((e) => e.toJson()).toList(),
      };

  factory WorkoutDay.fromJson(Map<String, dynamic> json) => WorkoutDay(
        id: json['id'],
        name: json['name'],
        exercises: (json['exercises'] as List?)?.map((e) => Exercise.fromJson(e)).toList() ?? [],
      );

  @override
  List<Object?> get props => [id, name, exercises];
}
