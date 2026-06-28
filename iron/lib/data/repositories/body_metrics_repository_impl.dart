import 'package:injectable/injectable.dart';
import '../../domain/entities/body_metrics.dart';
import '../../domain/repositories/body_metrics_repository.dart';

@LazySingleton(as: BodyMetricsRepository)
class BodyMetricsRepositoryImpl implements BodyMetricsRepository {
  @override
  Future<void> logWeight(BodyWeightEntry entry) async {}

  @override
  Future<List<BodyWeightEntry>> getWeightEntries() async => [];

  @override
  Future<List<BodyWeightEntry>> getWeightTrend() async => [];
}
