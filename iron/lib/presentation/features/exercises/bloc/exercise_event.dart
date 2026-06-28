import 'package:equatable/equatable.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();
  @override
  List<Object?> get props => [];
}

class LoadExercises extends ExerciseEvent {}
class SearchExercises extends ExerciseEvent {
  final String query;
  const SearchExercises(this.query);

  @override
  List<Object?> get props => [query];
}
