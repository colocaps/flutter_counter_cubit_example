import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(Initial(value: 0));
  int value = 0;
  Future<void> incrementValue() async {
    value = value + 1;
    emit(IncrementValue(value: value));
    if (value < 0) {
      emit(Warning());
    }
    if (value == 10) {
      emit(Message());
      emit(Initial(value: value));
    }
  }

  Future<void> decrementValue() async {
    value = value - 1;
    emit(DecrementValue(value: value));

    if (value < 0) {
      emit(Warning());
    }
    if (value == 10) {
      emit(Message());
      emit(Initial(value: value));
    }
  }

  Future<void> initState() async {
    emit(Initial(value: 0));
  }
}
