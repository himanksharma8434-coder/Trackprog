import 'package:equatable/equatable.dart';
import '../../../../domain/entities/workout_day.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<WorkoutDay> days;
  final String selectedDayId;

  const DashboardLoaded({
    required this.days,
    required this.selectedDayId,
  });

  WorkoutDay get selectedDay => days.firstWhere((d) => d.id == selectedDayId, orElse: () => days.first);

  DashboardLoaded copyWith({
    List<WorkoutDay>? days,
    String? selectedDayId,
  }) {
    return DashboardLoaded(
      days: days ?? this.days,
      selectedDayId: selectedDayId ?? this.selectedDayId,
    );
  }

  @override
  List<Object?> get props => [days, selectedDayId];
}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}
