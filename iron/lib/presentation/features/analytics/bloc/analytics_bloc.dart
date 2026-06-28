import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/workout_usecases.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

@injectable
class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetWorkoutHistoryUseCase getWorkoutHistory;

  AnalyticsBloc(this.getWorkoutHistory) : super(AnalyticsInitial()) {
    on<LoadAnalytics>((event, emit) async {
      emit(AnalyticsLoading());
      try {
        final history = await getWorkoutHistory();
        emit(AnalyticsLoaded(history));
      } catch (e) {
        emit(AnalyticsError(e.toString()));
      }
    });
  }
}
