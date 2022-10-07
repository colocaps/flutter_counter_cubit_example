import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';

listenerByState(
  BuildContext context,
  CounterState state,
) async {
  if (state is Message) {
    var snackBar = const SnackBar(
      content: Text(
        'Ha llegado al numero 10',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
