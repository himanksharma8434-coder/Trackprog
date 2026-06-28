import '../entities/workout_day.dart';

abstract class WorkoutDayRepository {
  Future<List<WorkoutDay>> getDays();
  Future<void> saveDays(List<WorkoutDay> days);
  Future<WorkoutDay> addDay(String name);
  Future<void> deleteDay(String id);
  Future<void> updateDay(WorkoutDay day);
}
