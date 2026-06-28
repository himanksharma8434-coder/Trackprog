import '../entities/body_metrics.dart';

abstract class BodyMetricsRepository {
  Future<void> logWeight(BodyWeightEntry entry);
  Future<List<BodyWeightEntry>> getWeightEntries();
  Future<List<BodyWeightEntry>> getWeightTrend();
}
