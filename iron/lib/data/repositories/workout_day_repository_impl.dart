import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/workout_day.dart';
import '../../domain/repositories/workout_day_repository.dart';
import '../local/storage/local_storage_service.dart';

@LazySingleton(as: WorkoutDayRepository)
class WorkoutDayRepositoryImpl implements WorkoutDayRepository {
  final LocalStorageService _storage;
  static const _key = 'workout_days';

  WorkoutDayRepositoryImpl(this._storage);

  @override
  Future<List<WorkoutDay>> getDays() async {
    final data = _storage.read(_key);
    if (data == null) {
      // Create a default Day 1
      final defaultDay = WorkoutDay(id: const Uuid().v4(), name: 'Day 1');
      await saveDays([defaultDay]);
      return [defaultDay];
    }
    return (data as List).map((e) => WorkoutDay.fromJson(e)).toList();
  }

  @override
  Future<void> saveDays(List<WorkoutDay> days) async {
    await _storage.save(_key, days.map((e) => e.toJson()).toList());
  }

  @override
  Future<WorkoutDay> addDay(String name) async {
    final days = await getDays();
    final newDay = WorkoutDay(id: const Uuid().v4(), name: name);
    days.add(newDay);
    await saveDays(days);
    return newDay;
  }

  @override
  Future<void> deleteDay(String id) async {
    final days = await getDays();
    days.removeWhere((d) => d.id == id);
    // Ensure there is at least one day
    if (days.isEmpty) {
      days.add(WorkoutDay(id: const Uuid().v4(), name: 'Day 1'));
    }
    await saveDays(days);
  }

  @override
  Future<void> updateDay(WorkoutDay day) async {
    final days = await getDays();
    final index = days.indexWhere((d) => d.id == day.id);
    if (index >= 0) {
      days[index] = day;
      await saveDays(days);
    }
  }
}
