import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/repositories/workout_day_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WorkoutDayRepository _repository;

  DashboardBloc(this._repository) : super(DashboardLoading()) {
    on<LoadDashboard>(_onLoadDashboard);
    on<SelectDay>(_onSelectDay);
    on<AddNewDay>(_onAddNewDay);
    on<DeleteDay>(_onDeleteDay);
    on<AddExerciseToDay>(_onAddExerciseToDay);
    on<RemoveExerciseFromDay>(_onRemoveExerciseFromDay);
  }

  Future<void> _onLoadDashboard(LoadDashboard event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final days = await _repository.getDays();
      emit(DashboardLoaded(days: days, selectedDayId: days.first.id));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  Future<void> _onSelectDay(SelectDay event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      emit((state as DashboardLoaded).copyWith(selectedDayId: event.dayId));
    }
  }

  Future<void> _onAddNewDay(AddNewDay event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      try {
        final newDay = await _repository.addDay(event.name);
        final days = await _repository.getDays();
        emit(DashboardLoaded(days: days, selectedDayId: newDay.id));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    }
  }

  Future<void> _onDeleteDay(DeleteDay event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      try {
        await _repository.deleteDay(event.dayId);
        final days = await _repository.getDays();
        emit(DashboardLoaded(days: days, selectedDayId: days.first.id));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    }
  }

  Future<void> _onAddExerciseToDay(AddExerciseToDay event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      try {
        final day = currentState.days.firstWhere((d) => d.id == event.dayId);
        if (day.exercises.any((e) => e.id == event.exercise.id)) {
          return; // Already added
        }
        final updatedExercises = List.of(day.exercises)..add(event.exercise);
        final updatedDay = day.copyWith(exercises: updatedExercises);
        await _repository.updateDay(updatedDay);
        
        final days = await _repository.getDays();
        emit(DashboardLoaded(days: days, selectedDayId: currentState.selectedDayId));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    }
  }

  Future<void> _onRemoveExerciseFromDay(RemoveExerciseFromDay event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      try {
        final day = currentState.days.firstWhere((d) => d.id == event.dayId);
        final updatedExercises = List.of(day.exercises)..removeWhere((e) => e.id == event.exercise.id);
        final updatedDay = day.copyWith(exercises: updatedExercises);
        await _repository.updateDay(updatedDay);
        
        final days = await _repository.getDays();
        emit(DashboardLoaded(days: days, selectedDayId: currentState.selectedDayId));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    }
  }
}
