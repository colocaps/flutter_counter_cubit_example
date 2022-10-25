import 'package:core/core.dart';
import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/counter_component/counter_text_component.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/build_counter.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterPage extends StatelessWidget {
  final String title;
  const CounterPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterCubit = InjectorContainer.instance.resolve<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: CustomIconButton(
        icon: const Icon(
          Icons.clear_sharp,
        ),
        onPressed: () {
          HydratedBloc.storage.clear();
          counterCubit.initState();
        },
      ),
      body: BuildCounter(
        counterTextComponent: CounterTextComponent(
          counterCubit: counterCubit,
        ),
        onDecrementPressed: () => counterCubit.decrementValue(),
        onIncrementPressed: () => counterCubit.incrementValue(),
      ),
    );
  }
}
