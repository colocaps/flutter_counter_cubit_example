import 'package:core/core.dart';
import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
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
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: _listenerByState,
        builder: _buildByState,
      ),
    );
  }

  _listenerByState(
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

  Widget _buildByState(
    BuildContext context,
    CounterState state,
  ) {
    if (state is Initial) {
      var value = state.value;
      return _buildCounterText(value, context);
    } else if (state is IncrementValue) {
      var value = state.value;
      return _buildCounterText(value, context);
    } else if (state is DecrementValue) {
      var value = state.value;
      return _buildCounterText(value, context);
    } else if (state is Warning) {
      return _buildWarning(context);
    }

    return Container();
  }

  Text _buildCounterText(int value, BuildContext context) {
    return Text(
      value.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _buildWarning(BuildContext context) {
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
            onPressed: () => _counterCubit.initState(),
          ),
        ],
      ),
    );
  }
}
