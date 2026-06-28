import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../domain/entities/body_metrics.dart';
import 'body_metrics_event.dart';
import 'body_metrics_state.dart';

@injectable
class BodyMetricsBloc extends Bloc<BodyMetricsEvent, BodyMetricsState> {
  final List<BodyWeightEntry> _history = [];

  BodyMetricsBloc() : super(BodyMetricsInitial()) {
    on<LoadBodyMetrics>((event, emit) {
      emit(BodyMetricsLoaded(List.from(_history)));
    });

    on<LogBodyWeight>((event, emit) {
      final entry = BodyWeightEntry(
        id: const Uuid().v4(),
        weightKg: event.weightKg,
        date: DateTime.now(),
      );
      _history.add(entry);
      _history.sort((a, b) => b.date.compareTo(a.date));
      emit(BodyMetricsLoaded(List.from(_history)));
    });
  }
}
