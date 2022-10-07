import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/build_by_state.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/listen_by_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterTextComponent extends StatelessWidget {
  final CounterCubit _counterCubit;

  const CounterTextComponent({
    Key? key,
    required CounterCubit counterCubit,
  })  : _counterCubit = counterCubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _counterCubit,
      child: const BlocConsumer<CounterCubit, CounterState>(
        listener: listenerByState,
        builder: buildByState,
      ),
    );
  }
}
