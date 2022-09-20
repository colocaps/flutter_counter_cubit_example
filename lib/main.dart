import 'package:ejemplo_cubit_clean_arch/bussines_logic/counter_cubit/counter_cubit.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/counter_component/counter_text_component.dart';
import 'package:ejemplo_cubit_clean_arch/presentation/widgets/build_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BL Cubit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Bitlogic Cubit Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var counterCubit = CounterCubit();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BuildConter(
        counterTextComponent: CounterTextComponent(
          counterCubit: counterCubit,
        ),
        onDecrementPressed: () => counterCubit.decrementValue(),
        onIncrementPressed: () => counterCubit.incrementValue(),
      ),
    );
  }
}
