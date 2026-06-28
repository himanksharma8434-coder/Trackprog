import 'package:equatable/equatable.dart';

abstract class BodyMetricsEvent extends Equatable {
  const BodyMetricsEvent();
  @override
  List<Object?> get props => [];
}

class LoadBodyMetrics extends BodyMetricsEvent {}

class LogBodyWeight extends BodyMetricsEvent {
  final double weightKg;
  const LogBodyWeight(this.weightKg);

  @override
  List<Object?> get props => [weightKg];
}
