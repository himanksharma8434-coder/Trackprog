import 'package:equatable/equatable.dart';
import '../../../../domain/entities/body_metrics.dart';

abstract class BodyMetricsState extends Equatable {
  const BodyMetricsState();
  @override
  List<Object?> get props => [];
}

class BodyMetricsInitial extends BodyMetricsState {}
class BodyMetricsLoading extends BodyMetricsState {}

class BodyMetricsLoaded extends BodyMetricsState {
  final List<BodyWeightEntry> history;
  const BodyMetricsLoaded(this.history);

  @override
  List<Object?> get props => [history];
}

class BodyMetricsError extends BodyMetricsState {
  final String message;
  const BodyMetricsError(this.message);

  @override
  List<Object?> get props => [message];
}
