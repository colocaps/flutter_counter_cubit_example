import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/build_counter_text.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/build_warning.dart';
import 'package:flutter/material.dart';

Widget buildByState(
  BuildContext context,
  CounterState state,
) {
  if (state is Initial) {
    var value = state.value;
    return BuildCounterText(
      text: value.toString(),
    );
  } else if (state is IncrementValue) {
    var value = state.value;
    return BuildCounterText(
      text: value.toString(),
    );
  } else if (state is DecrementValue) {
    var value = state.value;
    return BuildCounterText(
      text: value.toString(),
    );
  } else if (state is Warning) {
    return const BuildWarning();
  } else if (state is Loading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  return Container();
}
