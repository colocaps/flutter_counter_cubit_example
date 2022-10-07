import 'package:core/core.dart';
import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';

class BuildWarning extends StatelessWidget {
  const BuildWarning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterCubit = InjectorContainer.instance.resolve<CounterCubit>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(
              'Numero Negativo',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomIconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => counterCubit.initState(),
          ),
        ],
      ),
    );
  }
}
