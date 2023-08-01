import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CubitCounterState> {
  CounterCubit() : super(CubitCounterState(counter: 5));

  void increasedBy(int value) {
    emit(state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void reset() {
    emit(state.copyWith(
        counter: 0,
    ));
  }

}
