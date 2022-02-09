import 'package:bloc/bloc.dart';
import 'package:test_block_class/counter_bloc/counter_state.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateValue(count: 0)) {
    on<IncrementValue>(
      (event, emit) => emit(
        CounterStateValue(count: (state as CounterStateValue).count += 1),
      ),
    );
    on<DecrementValue>(
      (event, emit) => emit(
        CounterStateValue(count: (state as CounterStateValue).count -= 1),
      ),
    );
  }
}
