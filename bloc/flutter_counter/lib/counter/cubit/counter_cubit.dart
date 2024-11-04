import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
///
class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void increment() {
    if (state >= 10) {
      return emit(state + 10);
    }
    return emit(state + 1);
  }

  void decrement() {
    if (state <= 0) {
      return emit(0);
    }
    return emit(state - 1);
  }
}
