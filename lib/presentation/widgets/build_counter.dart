import 'package:ejemplo_cubit_clean_arch/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BuildConter extends StatelessWidget {
  final Widget _counterTextComponent;
  final void Function()? _onIncrementPressed;
  final void Function()? _onDecrementPressed;

  const BuildConter({
    Key? key,
    required Widget counterTextComponent,
    required void Function()? onIncrementPressed,
    required void Function()? onDecrementPressed,
  })  : _counterTextComponent = counterTextComponent,
        _onIncrementPressed = onIncrementPressed,
        _onDecrementPressed = onDecrementPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Ejemplo de Cubit para Bitlogicos',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          _counterTextComponent,
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: const Icon(
                  Icons.add,
                ),
                onPressed: _onIncrementPressed,
              ),
              CustomIconButton(
                icon: const Icon(
                  Icons.remove,
                ),
                onPressed: _onDecrementPressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
