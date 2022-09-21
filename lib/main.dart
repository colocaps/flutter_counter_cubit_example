import 'package:ejemplo_cubit_clean_arch/pages/counter_page.dart';
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
      title: 'Counter Cubit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(
        title: 'Counter Cubit Demo',
      ),
    );
  }
}
