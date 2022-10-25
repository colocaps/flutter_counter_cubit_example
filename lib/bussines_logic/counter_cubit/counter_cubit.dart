import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(Initial(value: 0));
  late int value;

  Future<void> incrementValue() async {
    value = value.isNaN ? 0 : value + 1;
    emit(IncrementValue(value: value));

    if (value == 10) {
      emit(Message());
      emit(Initial(value: value));
    }
  }

  Future<void> decrementValue() async {
    value = value.isNaN ? 0 : value - 1;
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
    value = 0;
    emit(Initial(value: value));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    value = json['value'];
    return Initial(value: json['value']);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    if (state is Initial) {
      return {'value': state.value};
    } else if (state is IncrementValue) {
      return {'value': state.value};
    } else if (state is DecrementValue) {
      return {'value': state.value};
    }
    return {'value': 0};
  }
}
